class PermanentCoursesController < ApplicationController
  before_action :set_permanent_course, only: [:show, :update, :destroy]

  # GET /permanent_courses
  def index
    @permanent_courses = PermanentCourse.all

    render json: @permanent_courses
  end

  # GET /permanent_courses/1
  def show
    render json: @permanent_course
  end

  # POST /permanent_courses
  def create
    @permanent_course = PermanentCourse.new(permanent_course_params)

    if @permanent_course.save
      render json: @permanent_course, status: :created, location: @permanent_course
    else
      render json: @permanent_course.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /permanent_courses/1
  def update
    if @permanent_course.update(permanent_course_params)
      render json: @permanent_course
    else
      render json: @permanent_course.errors, status: :unprocessable_entity
    end
  end

  # DELETE /permanent_courses/1
  def destroy
    @permanent_course.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_permanent_course
    @permanent_course = PermanentCourse.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def permanent_course_params
    params.fetch(:permanent_course, {})
  end
end
