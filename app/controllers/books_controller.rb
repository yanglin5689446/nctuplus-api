class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

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

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.includes(:courses, :user).find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def book_params
    params.fetch(:book, {})
          .permit(
            :time, :name, :authors, :info, :cover_image,
            :preview_url, :price, :status
          )
  end
end
