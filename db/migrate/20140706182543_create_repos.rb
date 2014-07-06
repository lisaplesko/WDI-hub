class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.string :languages
      t.belongs_to :students, index: true
    end
  end
end
