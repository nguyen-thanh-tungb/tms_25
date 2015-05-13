class SubjectCourse < ActiveRecord::Base
  belongs_to :courses
  belongs_to :subjects
   accepts_nested_attributes_for :subjects
end
