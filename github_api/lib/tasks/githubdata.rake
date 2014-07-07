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
    Event.delete_all
    Student.all.each do |student|
      # student.events.delete_all   ## remove??
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

  # desc "Download repository language composition"
  # task languages: :environment do
  #   Student.all.each do |student|
  #     student.repos.delete_all  ## remove??
  #     user = Octokit.user(student.username)
  #     user.rels[:repos].get.data.each do |repo|
  #       repository = repo[:name]
  #       lang = {} || ""
  #       lang = Octokit.languages("#{user[:login]}" + "/" + "#{repository}")
  #       student.repos << Repo.create!(name: repository, languages: lang)
  #     end
  #   end
  # end

  desc "Download repositories"
  task repos: :environment do
    Repo.delete_all
    Language.delete_all
    Student.all.each do |student|
      puts student.firstname
      # user = Octokit.user(student.username)
      repos = Octokit.repos(student.username)
      repos.each do |repo|
        student.repos << Repo.create!(id: repo[:id], name: repo[:name], stargazers_count: repo[:stargazers_count],
                                      watchers_count: repo[:watchers_count], description: repo[:description],
                                      html_url: repo[:html_url], updated_at: repo[:updated_at])

        languages = Octokit.languages("#{student.username}" + "/" + "#{repo[:name]}").to_h
        languages.each do |k,v|
          Language.create!(lang_name: k, lang_amount: v, repo_id: repo[:id])
        end
      end
    end
  end




end


# Reduce commit data to a more recent date?
# http://www.coderexception.com/C61H11zbUPSQJJJJ/using-ruby-github-api-to-filter-commits-by-date

# rescue Octokit::NotFound
#         false
