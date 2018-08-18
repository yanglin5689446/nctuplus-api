class My::InfoController < ApplicationController
  before_action :authenticate_user!

  # GET /my/events
  def events
    events = current_user.events

    render json: events
  end

  # GET /my/books
  def books
    books = current_user.books

    render json: books
  end

  # GET /my/past_exams
  def past_exams
    past_exams = current_user.past_exams

    render json: past_exams
  end

  # GET /my/courses
  def courses
    courses = current_user.courses

    render json: courses
  end
end
