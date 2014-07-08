class Student < ActiveRecord::Base

  validates :username, presence: true, uniqueness: true
  # before_action :set_user
  has_many :repos
  has_many :events

  # def commits
  #   user = Octokit.user(self.username)
  #   commit_collection = []
  #   user.rels[:events].get.data.each do |event|
  #     commit_data = {message: "", repo: "", date: ""}
  #     if event[:type] == "PushEvent"
  #       commit_data[:message] = event[:payload][:commits][0][:message]
  #       commit_data[:repo] = event[:repo][:name]
  #       commit_data[:date] = event[:created_at]
  #       commit_collection.push(commit_data)
  #     else
  #     end
  #   end
  #   return commit_collection
  # end

  # Returns total lines of code for all languages together
  def total_lines_code
    Language.where(repo_id: Repo.where(student: self).pluck(:id)).sum(:lang_amount)
  end

  def lines_per_language
    Language.where(repo_id: Repo.where(student: self).pluck(:id)).group(:lang_name).sum(:lang_amount)
  end


  # Language for entire account - each repository averaged together

  # def languages
  #   user = Octokit.user(self.username)
  #   language_collection = []
  #   user.rels[:repos].get.data.each do |repo|
  #     lang = {}
  #     repository = repo[:name]
  #     lang = Octokit.languages("#{user[:login]}" + "/" + "#{repository}")
  #     language_collection.push(lang)
  #   end
  #   return language_collection
  # end

  # def set_user
  #   user = Octokit.user(self.username)
  # end


end



#  Octokit.languages('lisaplesko/cellarage')
#  Will return =>  {:Ruby=>64820, :JavaScript=>2511, :CSS=>45971}

# https://sourcegraph.com/github.com/irqed/octokit
