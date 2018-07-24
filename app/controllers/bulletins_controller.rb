class BulletinsController < ApplicationController
  before_action :set_bulletin, only: [:show, :update, :destroy]

  # GET /bulletins
  def index
    @bulletins = Bulletin.all

    render json: @bulletins
  end

  # GET /bulletins/1
  def show
    render json: @bulletin
  end

  # POST /bulletins
  def create
    @bulletin = Bulletin.new(bulletin_params)

    if @bulletin.save
      render json: @bulletin, status: :created, location: @bulletin
    else
      render json: @bulletin.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bulletins/1
  def update
    if @bulletin.update(bulletin_params)
      render json: @bulletin
    else
      render json: @bulletin.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bulletins/1
  def destroy
    @bulletin.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bulletin
    @bulletin = Bulletin.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def bulletin_params
    params.fetch(:bulletin, {})
  end
end
