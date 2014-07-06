class Student < ActiveRecord::Base

  validates :username, presence: true, uniqueness: true

  def commits
    user = Octokit.user(self.username)
    commit_collection = []
    user.rels[:events].get.data.each do |event|
      commit_data = {message: "", repo: "", date: ""}
      if event[:type] == "PushEvent"
        commit_data[:message] = event[:payload][:commits][0][:message]
        commit_data[:repo] = event[:repo][:name]
        commit_data[:date] = event[:created_at]
        commit_collection.push(commit_data)
      else
      end
    end
    return commit_collection
  end

  # Language for entire account - each repository averaged together
  def languages
    user = Octokit.user(self.username)
    language_collection = []
    user.rels[:repos].get.data.each do |repo|
      lang = {}
      repository = repo[:name]
      lang = Octokit.languages("#{user[:login]}" + "/" + "#{repository}")
      language_collection.push(lang)
    end
    return language_collection
  end


end



#  Octokit.languages('lisaplesko/cellarage')
#  Will return =>  {:Ruby=>64820, :JavaScript=>2511, :CSS=>45971}


# --- documentation?
# def languages(repo, options = {})
#   paginate "#{Repository.path repo}/languages", options
# end





# GET /users/:username/repos

  # https://sourcegraph.com/github.com/irqed/octokit
