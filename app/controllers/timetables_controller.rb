class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:show, :update, :destroy]

  # GET /timetables
  def index
    @timetables = Timetable.all

    render json: @timetables
  end

  # GET /timetables/1
  def show
    render json: @timetable
  end

  # POST /timetables
  def create
    @timetable = Timetable.new(timetable_params)

    if @timetable.save
      render json: @timetable, status: :created, location: @timetable
    else
      render json: @timetable.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /timetables/1
  def update
    if @timetable.update(timetable_params)
      render json: @timetable
    else
      render json: @timetable.errors, status: :unprocessable_entity
    end
  end

  # DELETE /timetables/1
  def destroy
    @timetable.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_timetable
      @timetable = Timetable.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def timetable_params
      params.fetch(:timetable, {})
    end
end
