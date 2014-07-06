class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :repo
      t.text :message
      t.string :date
      t.belongs_to :student, index: true
    end
  end
end
