class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :username, null: false
      t.string :city
      t.string :session
      t.string :avatar_url
      t.string :url
      t.boolean :hireable
      t.string :company, default: ""

      t.timestamps
      t.index :username, unique: true
    end
  end
end
