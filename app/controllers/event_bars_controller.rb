class EventBarsController < ApplicationController
  def show
    @event_bar = EventBar.find(params[:id])
  end

  def update
    @event_bar = EventBar.find(params[:id])
    @event_bar.update(event_bar_params)
    @event = @event_bar.event.update(status: @event_bar.status)
    redirect_to event_bar_path(@event_bar)
  end

  private

  def event_bar_params
    params.require(:event_bar).permit(:status)
  end
end
