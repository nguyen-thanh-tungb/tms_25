class Supervisor::SubjectCoursesController < ApplicationController
  def index
  	@subject_course = SubjectCourse.find_by params[:course_id]
  end

  def show
  	
  end

  def new
  	@subject_course = SubjectCourse.new
  	#@subject_course.course_id = @course.id
  end

  def create
  	@course = Course.find params[:course_id]
  	@subject_course = @course.subjectcourses.create subject_courses_params
  	redirect_to supervisor_course_path
  end

  def edit
  	
  end

  def update
  	
  end

  def destroy
  	
  end

  private
  def subject_courses_params
    params.require(:subjectcourse).permit :course_id, :subject_id
  end
end
