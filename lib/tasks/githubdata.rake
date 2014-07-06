namespace :githubdata do

  desc "Download latest WDI github account data"
  task account_info: :environment do
    Student.all.each do |student|
      info = Octokit.user(student.username)
      student.update!(created_at: info.created_at, avatar_url: info.avatar_url, url: info.url, hireable: info.hireable, company: info.company, followers: info.followers, following: info.following, public_repos: info.public_repos, blog: info.blog)
    end
  end

  desc "Download recent commit events"
  task commit_messages: :environment do
    Student.all.each do |student|
      student.events.delete_all
      user = Octokit.user(student.username)
      if user.rels[:events].get.data

        user.rels[:events].get.data.each do |event|
          puts student.firstname
          if event[:type] == "PushEvent" && event[:payload][:commits] != []
            message = event[:payload][:commits][0][:message]
            puts message
            repo = event[:repo][:name] || ""
            puts repo
            date = event[:created_at] || ""
            puts date
            # if message
              student.events << Event.create!(message: message, repo: repo, date: date)
            # else
            #   puts "no commit data"
            # end
          else
            puts "Nope"

          end
        end

      else
        puts "#{student} has no event?"
      end
    end
  end




end



# rescue Octokit::NotFound
#         false
