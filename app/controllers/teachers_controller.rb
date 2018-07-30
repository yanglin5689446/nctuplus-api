class TeachersController < ApplicationController
  # GET /teachers
  def index
    @teachers = Teacher.all

    render json: @teachers
  end
end
