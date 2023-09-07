class VotesController < ApplicationController

  def create
    @event_bar = EventBar.find(params[:event_bar_id])
    @event = @event_bar.event
    @participants = @event.participants
    @participant = @participants.find_by(user: current_user)
    @vote = Vote.new(participant: @participant, event_bar: @event_bar)
    if @vote.save
      # Blabliblou happy path
      redirect_to event_path(@event) # notice: "You have voted for #{@event_bar.bar.name}!"
    else
      # Bloublehblah unhappy path
      redirect_to event_path(@event), notice: "Your vote for #{@event_bar.bar.name} could not be registered, here's why: #{@event_bar.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy
    redirect_to event_path(@vote.event_bar.event), notice: "You have cancelled your vote for #{@vote.event_bar.bar.name}!", status: :see_other
  end
end
