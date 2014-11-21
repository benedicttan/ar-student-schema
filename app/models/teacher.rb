require_relative '../../db/config'

class Teacher < ActiveRecord::Base

  # validates :email, format: { :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]{2,}\z/, :message => "Wrong email!" }

  validates :email, uniqueness: {:message => "Email not unique!"}

  has_many :student_teachers, :foreign_key => :teacher_id
  has_many :students, :through => :student_teachers

  # validate :phone_checker

  # def phone_checker
  #   temp_phone = phone.to_s.gsub(/\D/,"")
  #   if !(temp_phone =~ /\d{10,}/)
  #     errors.add(:phone, "Wrong format for number")
  #   end
  # end



end

