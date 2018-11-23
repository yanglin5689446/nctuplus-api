class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy, :status]
  before_action :authenticate_user!, except: [:index, :show]
  wrap_parameters Book, format: :json, exclude: []

  # GET /books
  def index
    page = params[:page].try(:to_i) || 1
    per_page = params[:per_page].try(:to_i) || 15
    filters = Book.includes(:courses, :user).ransack(params[:q])
    @books = filters.result(distnct: true).page(page).per(per_page)

    render json: {
      current_page: page,
      total_pages: @books.total_pages,
      total_count: @books.total_count,
      data: @books
    }
  end

  # GET /books/1
  def show
    @book.view_count += 1
    @book.save
    render json: @book
  end

  # POST /books
  def create
    @book = current_user.books.build(book_params)
    @book.add_applicable_courses(course_id_array)
    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if current_user.id != @book.user_id
      render json: { "error": "user doesn't match" }, status: :unauthorized
    elsif @book.update_book(book_params, course_id_array)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1/status
  def status
    if current_user.id != @book.user_id
      render json: { "error": "user doesn't match" }, status: :unauthorized
    elsif @book.update_attributes(status: params[:status])
      render json: { id: @book.id, status: @book.status }, status: :ok
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    if current_user.id != @book.user_id
      render json: { "error": "user doesn't match" }, status: :unauthorized
    else
      @book.destroy
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.includes(:courses, :user).find(params[:id] || params[:book_id])
  end

  # Only allow a trusted parameter "white list" through.
  def book_params
    params.fetch(:book, {})
          .permit(
            :name, :isbn, :authors, :info, :contact_way, :cover_image,
            :price
          )
  end

  # Get and sort all the course_id within parameters
  def course_id_array
    if params.fetch(:book, {}).key?(:courses)
      params.fetch(:book, {})
            .permit(
              courses: [:course_id]
            )
            .fetch(:courses)
            .map { |course| course[:course_id] }
            .try(:sort_by!) { |id| id }
    else
      []
    end
  end
end
