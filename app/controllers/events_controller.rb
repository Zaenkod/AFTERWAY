class EventsController < ApplicationController
  before_action :set_users, only: %i[new create]

  def new
    @user = User.find(current_user.id)
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @user = User.find(current_user.id)
    @event.user = @user

    if @event.save
      if @event.address.present?
        @event.bars << Bar.near(@event.address, @event.distance)
      else
        geocode_center
        @event.bars << Bar.near(@barycenter, @event.distance)
      end
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    # @event_bars = @event.event_bars
    # @my_events = @event_bars.where(user: current_user)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = event.find(params[:id])
    if @event.update(event_params)
      redirect_to myevents_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def myevents
    @myevents = Event.where(id:current_user.id)

  end

  private

  def geocode_center
    addresses_participants = @event.users.pluck(:latitude, :longitude)
    @barycenter = Geocoder::Calculations.geographic_center(addresses_participants)
  end

  def event_params
    params.require(:event).permit(:title, :date, :address, :distance, :hour, :category, :price, :users, user_ids: [])
  end

  def set_users
    @users = User.where.not(id: current_user.id).order(:first_name)
  end
end
