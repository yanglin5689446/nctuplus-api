class SemestersController < ApplicationController
  # GET /semesters
  def index
    @semesters = Semester.all

    render json: @semesters
  end
end
