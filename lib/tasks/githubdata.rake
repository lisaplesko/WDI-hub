namespace :githubdata do

  desc "Download latest WDI github account data"
  task account_info: :environment do
    Student.all.each do |student|
      info = Octokit.user(student.username)
      student.update!(created_at: info.created_at, avatar_url: info.avatar_url, url: info.url, hireable: info.hireable, company: info.company, followers: info.followers, following: info.following, public_repos: info.public_repos, blog: info.blog)
    end
  end
end



# rescue Octokit::NotFound
#         false
