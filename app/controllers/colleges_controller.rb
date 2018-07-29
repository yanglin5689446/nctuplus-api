class CollegesController < ApplicationController
  # GET /colleges
  def index
    @colleges = College.all

    render json: @colleges
  end
end
