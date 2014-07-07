class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.string :lang_name
      t.integer :lang_amount
      t.belongs_to :repo, index: true
      t.timestamps
    end

    add_index :languages, [:lang_name, :repo_id], unique: true
  end
end
