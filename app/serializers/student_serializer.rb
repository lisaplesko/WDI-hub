class StudentSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :username, :avatar_url, :city, :session
end
