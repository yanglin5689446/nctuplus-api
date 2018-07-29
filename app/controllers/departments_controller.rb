class DepartmentsController < ApplicationController
  # GET /departments
  def index
    @departmetns = Department.all

    render json: @departmetns
  end
end
