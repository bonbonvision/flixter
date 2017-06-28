class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_currently_enrolled

  def show
  end

  private

  helper_method :current_lesson

  def require_currently_enrolled
    if ! current_user.enrolled_in?(current_lesson.section.course)
      redirect_to course_path(current_lesson.section.course), :alert => "You must be enrolled to view the lesson."
    end
  end

  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

end



 # before_action :require_authorized_for_current_course, only: [:show]

 #  def new
 #    @course = Course.new
 #  end

 #  def create
 #    @course = current_user.courses.create(course_params)
 #    if @course.valid?
 #      redirect_to instructor_course_path(@course)
 #    else
 #      render :new, status: :unprocessable_entity
 #    end
 #  end

 #  def show
 #  end

 #  private

 #  helper_method :current_course

 #  def require_authorized_for_current_course
 #    if current_course.user != current_user
 #      render plain: "Unauthorized", status: :unauthorized
 #    end
 #  end