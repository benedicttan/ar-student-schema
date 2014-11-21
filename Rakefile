require 'rake'
require 'rspec/core/rake_task'
require_relative 'db/config'
require_relative 'lib/students_importer'


desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the test database with sample data"
task "db:populate" do
  StudentsImporter.import
end

desc "populate the test database with 9 teachers"
task "db:populate_teachers" do

    require_relative "app/models/teacher.rb"

    teacher1 = Teacher.create!(
      :first_name => "Kreay",
      :last_name => "Shawn",
      :email => 'kreayshawn@oaklandhiphop.net',
      :phone => '0123456789'
    )

    teacher2 = Teacher.create!(
      :first_name => "Kean",
      :last_name => "Seng",
      :email => 'keng.seng@sky.net',
      :phone => '1234567890'
    )

    teacher3 = Teacher.create!(
      :first_name => "Wei",
      :last_name => "Jia",
      :email => 'wei.jia@sky.net',
      :phone => '234567891'
    )


    teacher4 = Teacher.create!(
      :first_name => "Cheryll",
      :last_name => "Lim",
      :email => 'cheryll.lim@sky.net',
      :phone => '3456789012'
    )

    teacher5 = Teacher.create!(
      :first_name => "Azlan",
      :last_name => "Buluidong",
      :email => 'buluidong@sky.net',
      :phone => '4567890123'
    )

    teacher6 = Teacher.create!(
      :first_name => "Dill",
      :last_name => "Malek",
      :email => 'dill.malek@sky.net',
      :phone => '5678901234'
    )

    teacher7 = Teacher.create!(
      :first_name => "You",
      :last_name => "Jing",
      :email => 'you.jing@sky.net',
      :phone => '6789012345'
    )

    teacher8 = Teacher.create!(
      :first_name => "Josh",
      :last_name => "Teng",
      :email => 'josh.teng@sky.net',
      :phone => '7890123456'
    )


    teacher9 = Teacher.create!(
      :first_name => "Kam",
      :last_name => "Soon",
      :email => 'kam.soon@sky.net',
      :phone => '8901234567'
    )
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'Assigns first teacher sequentially'
task "db:assign_teacher1" do
  i = 0
  students = Student.all
  students.each do |student|
    StudentTeacher.create!(
      :teacher_id => (i%9)+1,
      :student_id => student.id
    )
    i += 1
  end
end

desc 'Assigns second teacher randomly'
task "db:assign_teacher2" do
  students = Student.all
  students.each do |student|
    StudentTeacher.create!(
      :teacher_id => rand(1..9),
      :student_id => student.id
    )
  end
end



desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs