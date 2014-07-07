class Repo < ActiveRecord::Base
  self.primary_key = "id"
  belongs_to :student
  has_many :languages
end
