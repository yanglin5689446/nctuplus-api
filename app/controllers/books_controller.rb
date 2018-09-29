class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  # GET /books
  def index
    page = params[:page].try(:to_i) || 1
    per_page = params[:per_page].try(:to_i) || 25
    filters = Book.ransack(params[:q])
    @books = filters.result(distnct: true).page(page).per(per_page)

    response_list = []
    @books.each do |book|
      response_list.push(response_assignment(book, User.find(book.user_id)))
    end

    response_list = sort_index(response_list, params)

    render json: {
      current_page: page,
      total_pages: @books.total_pages,
      total_count: @books.total_count,
      data: response_list
    }
  end

  # GET /books/1
  def show
    @book.view_count += 1
    @book.save

    response = response_assignment(@book, User.find(@book.user_id))

    render json: response
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    @book.user_id = current_user.id

    if @book.save
      response = response_assignment(@book, current_user)
      render json: response, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)

      response = response_assignment(@book, current_user)

      render json: response
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
    @book = Book.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def book_params
    params.fetch(:book, {})
          .permit(
            :time, :name, :authors, :info, :cover_image,
            :preview_url, :price, :status, :isbn
          )
  end

  def response_assignment(book, user)
    response = {}
    response[:id] = book.id
    response[:name] = book.name
    response[:authors] = book.authors
    response[:isbn] = book.isbn
    response[:user] = user

    response[:cover_image] = book.cover_image
    response[:price] = book.price
    response[:info] = book.info
    response[:contact_way] = user.email
    response[:status] = book.status
    response[:view_count] = book.view_count
    response[:created_at] = book.created_at
    response[:updated_at] = book.updated_at

    response[:courses] = book.courses
    response
  end

  def sort_index(response_list, params)
    if params[:sort_by] == 'price'
      response_list.sort_by! { |a| a[:price] }
    elsif params[:sort_by] == 'time' && params[:descend] == true
      response_list.sort_by! { |a| a[:created_at] }.reverse
    else
      response_list.sort_by! { |a| a[:created_at] }
    end
    response_list
  end
end
