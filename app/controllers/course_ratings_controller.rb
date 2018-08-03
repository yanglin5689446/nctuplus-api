class CourseRatingsController < ApplicationController
  before_action :set_course_rating, only: [:show, :update, :destroy]

  # GET /course_ratings
  def index
    @course_ratings = CourseRating.all

    render json: @course_ratings
  end

  # GET /course_ratings/1
  def show
    render json: @course_rating
  end

  # POST /course_ratings
  def create
    @course_rating = CourseRating.new(course_rating_params)

    if @course_rating.save
      render json: @course_rating, status: :created, location: @course_rating
    else
      render json: @course_rating.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /course_ratings/1
  def update
    if @course_rating.update(course_rating_params)
      render json: @course_rating
    else
      render json: @course_rating.errors, status: :unprocessable_entity
    end
  end

  # DELETE /course_ratings/1
  def destroy
    @course_rating.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_rating
      @course_rating = CourseRating.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def course_rating_params
      params.fetch(:course_rating, {})
    end
end
