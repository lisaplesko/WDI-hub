class Student < ActiveRecord::Base

  validates :username, presence: true, uniqueness: true
  has_many :repos
  has_many :events

  # Returns total lines of code for all languages together
  def total_lines_code
    Language.where(repo_id: Repo.where(student: self).pluck(:id)).sum(:lang_amount)
  end

  # Return all languages belonging to a particular user's repo
  def lines_per_language
    Language.where(repo_id: Repo.where(student: self).pluck(:id)).group(:lang_name).sum(:lang_amount)
  end

end


#  Octokit.languages('lisaplesko/cellarage')
#  Will return =>  {:Ruby=>64820, :JavaScript=>2511, :CSS=>45971}
#  https://sourcegraph.com/github.com/irqed/octokit
