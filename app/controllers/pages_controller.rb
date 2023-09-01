class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    if user_signed_in?
      @host_events = current_user.events
      @invitation_events = current_user.participations
    end
  end
end
