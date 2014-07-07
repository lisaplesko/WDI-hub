namespace :githubdata do

  desc "Download latest WDI github account data"
  task account_info: :environment do
    Student.all.each do |student|
      info = Octokit.user(student.username)
      student.update!(created_at: info.created_at, avatar_url: info.avatar_url, url: info.html_url, hireable: info.hireable, company: info.company, followers: info.followers, following: info.following, public_repos: info.public_repos, blog: info.blog)
    end
  end

  desc "Download recent commit events"
  task commit_messages: :environment do
    Student.all.each do |student|
      student.events.delete_all   ## remove??
      user = Octokit.user(student.username)
      if user.rels[:events].get.data

        user.rels[:events].get.data.each do |event|
          # Prevent empty commit from blowing up rake task
          if event[:type] == "PushEvent" && event[:payload][:commits] != []
            message = event[:payload][:commits][0][:message]
            repo = event[:repo][:name] || ""
            date = event[:created_at] || ""
            student.events << Event.create!(message: message, repo: repo, date: date)
          end
        end
      end
    end
  end

  desc "Download repository language composition"
  task languages: :environment do
    Student.all.each do |student|
      student.repos.delete_all  ## remove??
      user = Octokit.user(student.username)
      user.rels[:repos].get.data.each do |repo|
        repository = repo[:name]
        lang = {} || ""
        lang = Octokit.languages("#{user[:login]}" + "/" + "#{repository}")
        student.repos << Repo.create!(name: repository, languages: lang)
      end
    end
  end


end



# rescue Octokit::NotFound
#         false
