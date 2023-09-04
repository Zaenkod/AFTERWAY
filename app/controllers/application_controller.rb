class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :compute_notifications_counter

  private

  def compute_notifications_counter
    return unless current_user

    @notification_counter = current_user.notifications.count
  end
end
