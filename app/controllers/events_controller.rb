class EventsController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @user = User.find(current_user.id)
    @event.user = @user
    if @event.save
      @event.bars << Bar.all
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
    @myevents = Event.where(id: current_user.id)
    raise
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :address, :travel_time, :hour, :category, :price, :user_id)
  end
end
