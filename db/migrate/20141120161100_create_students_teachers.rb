class CreateStudentsTeachers < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :student_teachers, id: false do |t|
      t.belongs_to :student
      t.belongs_to :teacher
    end
  end
end