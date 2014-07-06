# Provide authentication credentials
Octokit.configure do |c|
  c.access_token = ENV['GITHUB_ACCESS_TOKEN']
end
