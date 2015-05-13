class Subject < ActiveRecord::Base
  has_many :subject_courses
  has_many :courses, through: :subject_courses
  #accepts_nested_attributes_for :courses
  has_many :tasks
end
