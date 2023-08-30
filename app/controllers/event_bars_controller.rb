class EventBarsController < ApplicationController
  def show
    @event_bar = EventBar.find(params[:id])
  end

  def update
    @event_bar = EventBar.find(params[:id])
    @event_bar.update(event_bar_params)
    redirect_to event_path(@event_bar.event)
  end

  private

  def event_bar_params
    params.require(:event_bar).permit(:status)
  end
end
