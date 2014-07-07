class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.json :languages
      t.integer :stargazers_count
      t.integer :watchers_count
      t.text :description
      t.string :html_url
      t.belongs_to :student, index: true
      t.timestamps
    end
  end
end
