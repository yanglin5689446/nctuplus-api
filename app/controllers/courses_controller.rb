class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :update, :destroy]

  # GET /courses
  def index
    @courses = Course.all

    render json: @courses
  end

  # GET /courses/1
  def show
    render json: @course, include: %I[
      permanent_course
      last_edit_user
      course_ratings
    ]
  end

  # PATCH/PUT /courses/1
  def update
    if @course.update(course_params)
      render json: @course
    else
      render json: @course.errors, status: :unprocessable_entity
    end
  end

  # @todo: 現在只是新建 course_rating model，
  # 等 auth 系統好了之後根據傳進來的 user token 建立與 course_rating 與 user 關聯
  def rating
    course_rating_params = params.permit(:category, :score, :course_id)
    course_rating = CourseRating.new(course_rating_params)
    if course_rating.save
      render json: course_rating, status: :created
    else
      render json: course_rating.errors, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def course_params
    params.fetch(:course, {})
          .permit(:assignment_record, :exam_record, :rollcall_frequency)
  end
end
