class Supervisor::CoursesController < ApplicationController
  def index
    @courses = Course.paginate page: params[:page], per_page: 20
  end

  def new
    @course = Course.new
  end

  def create
    byebug
    @course = Course.new course_params
    if @course.save
      flash[:success] = t(:course_created)
      redirect_to supervisor_courses_path @course
    else
      render 'new'
    end
  end

  def show
    @course = Course.find params[:id]
    # @structure = @course.structure.paginate page: params[:page], per_page: 10
  end

  def edit
    @course = Course.find params[:id]
  end

  def update
    @course = Course.find_by params[:id]
    @course.update_attributes course_params
    flash[:success] = "Course updated"
    redirect_to supervisor_course_path @course
  end

  def destroy
    Course.find_by(params[:id]).destroy
    flash[:success] = "Course deleted"
    redirect_to supervisor_courses_path
  end
  
  private
  def course_params
    params.require(:course).permit :name, :instruction, subjects_attributes: [:name]
  end
  
end
