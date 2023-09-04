class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @host_events = current_user.events
    @invitation_events = current_user.participations
  end

  def recap
    @host_events = current_user.events
    @invitation_events = current_user.participations

    if params[:query].present?
      @host_events = @host_events.where("title ILIKE ?", "%#{params[:query]}%")
      @invitation_events = @invitation_events.where("title ILIKE ?", "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text {
        render partial: "recap",
        locals: {
          host_events: @host_events,
          invitation_events: @invitation_events
        },
        formats: [:html]
      }
    end
  end
end
