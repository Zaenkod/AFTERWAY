class EventsController < ApplicationController
  before_action :set_users, only: %i[new create]

  def new
    @user = User.find(current_user.id)
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @user = current_user
    @event.user = @user

    if @event.save
      Participant.create!(event: @event, user: current_user)

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
    @participant = @event.participants.find_by( user: current_user)
    @event_bars = @event.event_bars.sort_by { |event_bar| -event_bar.votes.count }

    @bars = @event.bars.all
    @markers = @bars.geocoded.map do |bar|
      {
        lat: bar.latitude,
        lng: bar.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {bar: bar}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def edit
    @event = Event.find(params[:id])
    @users = User.all
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      if @event.address.present?
        @event.bars << Bar.near(@event.address, @event.distance)
      else
        geocode_center
        @event.bars << Bar.near(@barycenter, @event.distance)
      end
      redirect_to event_path(@event)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to myevents_path, status: :see_other
  end

  def myevents
    @host_events = current_user.events
    @invitation_events = current_user.participations
  end

  def update_participant
    event = Event.find(params[:id])
    participant = event.participants.find_by(user: current_user)
    participant.status = "#{params[:status]}"
    if participant.save
      render json: { success: true }
    else
      render json: { success: false }
    end
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
