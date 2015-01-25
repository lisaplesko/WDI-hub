namespace :githubdata do

  desc "Download latest WDI github account data"
  task account_info: :environment do
    Student.all.each do |student|
      begin
        info = Octokit.user(student.username)
        http = info.blog
        if http
          if http.start_with? "@"
            http.gsub!(/(^\@)/) {""}
            http.insert(0, "twitter.com/")
          end
          http.gsub!(/((http|https)\:\/\/)/) {""}
        end
        student.update!(created_at: info.created_at, avatar_url: info.avatar_url, url: info.html_url, hireable: info.hireable, company: info.company, followers: info.followers, following: info.following, public_repos: info.public_repos, blog: http)
      rescue Octokit::NotFound
        p "Failed to find account: #{student.username}"
      end
    end
  end

  desc "Download recent commit events"
  task commit_messages: :environment do
    Event.delete_all
    Student.all.each do |student|
      puts student.username
      user = Octokit.user(student.username)
      if user.rels[:events].get.data
        count = 0
        user.rels[:events].get.data.each do |event|
          if event[:type] == "PushEvent" && !event[:payload][:commits].empty? && event[:public] == true
            repo = event[:repo][:name] || ""
            date = event[:created_at] || ""
            commits = event[:payload][:commits]

            commits.each do |commit|
              message = commit.message
              student.events << Event.create!(message: message, repo: repo, date: date)
              count += 1
              break if count > 5
            end
          end
        end
      end
    end
  end

  desc "Download repositories"
  task repos: :environment do
    Language.delete_all
    Student.all.each do |student|
      puts student.firstname
      puts student.id
      repo_response = Octokit.repos(student.username)
      repo_response.each do |repo|
        if repo[:homepage] && repo[:homepage].start_with?("http")
          homepage_url = repo[:homepage].gsub!(/((http|https)\:\/\/)/) {""} if repo[:homepage]
        else
          homepage_url = repo[:homepage] if repo[:homepage]
        end
        Repo.find_or_create_by(id: repo[:id]).update_attributes({
          name: repo[:name], stargazers_count: repo[:stargazers_count],
          watchers_count: repo[:watchers_count], description: repo[:description],
          html_url: repo[:html_url], updated: repo[:updated_at],
          homepage: homepage_url, student_id: student.id })

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
