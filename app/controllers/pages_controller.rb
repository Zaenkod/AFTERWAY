class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @host_events = current_user.events
    @invitation_events = current_user.participations
  end
end
