class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :compute_notifications_counter
  before_action :lol

  private

  def compute_notifications_counter
    return unless current_user

    @notification_counter = current_user.notifications.count
  end

  def lol
    flash[:alert] = 'oui?'
  end
end
