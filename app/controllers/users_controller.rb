class UsersController < ApplicationController
  def index
    page = params[:page].try(:to_i) || 1
    per_page = params[:per_page].try(:to_i) || 25
    filters = User.ransack(params[:q])

    users = filters.result(distnct: true).page(page).per(per_page)

    render json: {
      current_page: page,
      total_pages: users.total_pages,
      total_count: users.total_count,
      data: users
    }
  end
end
