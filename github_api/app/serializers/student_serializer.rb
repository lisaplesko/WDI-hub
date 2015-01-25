class StudentSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :avatar_url, :city, :cohort
end
