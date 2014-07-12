class StudentShowSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :username, :avatar_url, :url, :city, :followers, :following, :public_repos, :blog
  has_many :events
  has_many :repos
end
