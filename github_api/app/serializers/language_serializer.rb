class LanguageSerializer < ActiveModel::Serializer
  attributes :id, :lang_name, :lang_amount, :repo_id
end
