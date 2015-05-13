class Course < ActiveRecord::Base
  has_many :subject_courses
  has_many :subjects, through: :subject_courses

  accepts_nested_attributes_for :subjects
  accepts_nested_attributes_for :subject_courses
  
  validates :name, presence:true, length: {maximum: 50}
  
  before_save :generate_code

  def structure
    subject_ids = "SELECT subject_id FROM subject_courses
                   WHERE course_id = course.id"
    Subject.where("subject_id IN #{subject_ids}", subject_id: id)
  end

  private
  def generate_code
    string = self.name.split(" ")
    number = 20 + Random.rand(1000)
    self.course_code = string[0] + number.to_s
  end
end
