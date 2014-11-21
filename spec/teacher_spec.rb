require 'rspec'
require 'date'
require_relative '../app/models/teacher'
require_relative '../app/models/student'

describe Teacher, "1st validations" do

  before(:all) do
    raise RuntimeError, "be sure to run 'rake db:migrate' before running these specs" unless expect(ActiveRecord::Base.connection.table_exists?(:teachers)).to eq(true)
      # Teacher.delete_all
  end

  before(:each) do
    @teacher1 = Teacher.new
    @teacher1.assign_attributes(
      :first_name => "Kreay",
      :last_name => "Shawn",
      :email => 'kreayshawn@oakey.net',
      :phone => '0123456789'
    )
  end

  it "shouldn't allow two teachers with the same email" do
    another_teacher = Teacher.create!(
      :email => @teacher1.email
    )

    # puts "TEACHER EMAIL: " + @teacher1.email.to_s
    expect(@teacher1).to_not be_valid
  end

  # given a student, can you find a teacher? Can you find all of her students?
  it "unable to find Joe Landers' (id 53) teacher, Josh Teng (id 8)" do
    JoeLanders = Student.find(53)
    expect(JoeLanders.teacher_id).to eq 8
  end

  # Does Josh Teng have 6 students?
  it "Josh Teng (id 8) has 6 students" do
    # JoshTeng = Teacher.find(8)
    studentCount = Student.where("teacher_id = ?",8).length
    expect(studentCount).to eq 6

    Teacher.last.delete
  end

  # it "assign students to teachers" do
  #       students = Student.all

  #   puts "teacher 1st time"
  #   puts @teacher9.inspect

  #   students.each do |student|
  #     student.teacher = @teacher9
  #     student.save
  #   end

  #   puts "teacher 2st time"
  #   puts @teacher9.inspect
  #   # puts Student.all.first.teacher.inspect
  # end

end
