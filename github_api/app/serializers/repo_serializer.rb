class RepoSerializer < ActiveModel::Serializer
  attributes :name, :stargazers_count, :watchers_count, :description, :html_url, :updated
  has_many :languages
end
