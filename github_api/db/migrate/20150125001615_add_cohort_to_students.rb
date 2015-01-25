class AddCohortToStudents < ActiveRecord::Migration
  def change
    add_column :students, :cohort, :integer
  end
end
