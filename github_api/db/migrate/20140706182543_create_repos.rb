class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.json :languages
      t.belongs_to :student, index: true
    end
  end
end