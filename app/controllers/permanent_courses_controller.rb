class PermanentCoursesController < ApplicationController
  # GET /permanent_courses
  def index
    @permanent_courses = PermanentCourse.all

    render json: @permanent_courses
  end

  # GET /permanent_courses/1
  def show
    @permanent_course = PermanentCourse.find(params[:id])
    render json: @permanent_course
  end
end
