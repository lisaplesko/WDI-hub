class StudentSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :username, :avatar_url, :city, :session, :followers, :following, :public_repos, :blog
end
