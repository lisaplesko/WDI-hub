class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos, id: false do |t|
      t.integer :id, null: false
      t.string :name
      t.integer :stargazers_count
      t.integer :watchers_count
      t.text :description
      t.string :html_url
      t.belongs_to :student, index: true
      t.timestamps
    end
    add_index :repos, :id, unique: true
  end
end

