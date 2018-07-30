class DepartmentsController < ApplicationController
  # GET /departments
  def index
    @departments = Department.all

    render json: @departments
  end
end
