class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]
  before_action :authenticate_user!, only: [:action, :revoke_action]

  # GET /events
  def index
    @events = Event.all

    render json: @events
  end

  # GET /events/1
  def show
    @event.view_count += 1
    @event.save
    render json: @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  # POST /events/1/follow
  def follow
    event_id = params[:event_id]
    new_follow = UsersEvent
                 .where(user_id: current_user.id, event_id: event_id)
                 .first_or_create
    render json: new_follow, status: :created
  end

  # DELETE /events/1/follow
  def unfollow
    event_id = params[:event_id]
    UsersEvent.where(user_id: current_user.id, event_id: event_id).destroy_all
    render json: {}, status: :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id] || params[:event_id])
  end

  # Only allow a trusted parameter "white list" through.
  def event_params
    params.fetch(:event, {})
          .permit(
            :event_type, :title, :organization, :location, :url,
            :content, :begin_time, :end_time, :user_id, :cover_image
          )
  end
end
