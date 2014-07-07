class Repo < ActiveRecord::Base
  belongs_to :student
  has_many :languages

end
