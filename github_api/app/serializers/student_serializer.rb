class StudentSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :username, :avatar_url, :url, :city, :session, :followers, :following, :public_repos, :blog
  has_many :events
end
