require_relative '../config'

# this is where you should use an ActiveRecord migration to

class UpdateStudents < ActiveRecord::Migration
  def up

    add_column :students, :name, :string

    students = Student.all
    students.each do |student|
      student.name = student.first_name << " " << student.last_name
      student.save
    end

    remove_column :students, :first_name
    remove_column :students, :last_name

  end
end

