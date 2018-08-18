class My::TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show, :update, :destroy]
  before_action :authenticate_user!

  # GET /my/timetables
  def index
    timetables = current_user.timetables

    render json: timetables
  end

  # GET /my/timetables/1
  def show
    showable = @timetable.user == current_user || @timetable.shareable
    render(json: @timetable, include: [:courses]) if showable
  end

  # POST /my/timetables
  def create
    @timetable = Timetable.new(user_id: current_user.id)

    if @timetable.save
      render json: @timetable, status: :created, location: my_timetable_url(@timetable)
    else
      render json: @timetable.errors, status: :unprocessable_entity
    end
  end

  # @todo: 課表新增/刪除課程邏輯
  # PATCH/PUT /my/timetables/1
  def update
    if @timetable
      render json: @timetable
    else
      render json: @timetable.errors, status: :unprocessable_entity
    end
  end

  # DELETE /my/timetables/1
  def destroy
    @timetable.destroy if @timetable.user == current_user
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_timetable
    @timetable = Timetable.includes(:courses).find(params[:id])
  end
end
