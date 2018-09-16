class PastExamsController < ApplicationController
  before_action :set_past_exam, only: [:show, :update, :destroy]

  # GET /past_exams
  def index
    page = params[:page].try(:to_i) || 1
    per_page = params[:per_page].try(:to_i) || 25
    filters = PastExam.includes(:course, :uploader).ransack(params[:q])

    @past_exams = filters.result(distnct: true).page(page).per(per_page)

    render json: {
      current_page: page,
      total_pages: @past_exams.total_pages,
      total_count: @past_exams.total_count,
      data: @past_exams
    }
  end

  # GET /past_exams/1
  def show
    render json: @past_exam
  end

  # POST /past_exams
  def create
    @past_exam = PastExam.new(past_exam_params)

    if @past_exam.save
      render json: @past_exam, status: :created, location: @past_exam
    else
      render json: @past_exam.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /past_exams/1
  def update
    if @past_exam.update(past_exam_params)
      render json: @past_exam
    else
      render json: @past_exam.errors, status: :unprocessable_entity
    end
  end

  # DELETE /past_exams/1
  def destroy
    @past_exam.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_past_exam
    @past_exam = PastExam.includes(:course, :uploader).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def past_exam_params
    params.fetch(:past_exam, {})
          .permit(:description, :file, :course_id)
  end
end
