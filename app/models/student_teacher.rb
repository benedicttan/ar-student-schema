require_relative '../../db/config'

class StudentTeacher < ActiveRecord::Base
  self.table_name = "student_teachers"
  belongs_to :student
  belongs_to :teacher
end

