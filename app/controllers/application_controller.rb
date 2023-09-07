class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :compute_notifications_counter

  private

  def compute_notifications_counter
    return unless current_user

    @notification_counter = current_user.notifications.count
  end

  def default_url_options
    { host: ENV["www.afterway.me"] || "localhost:3000" }
  end
end
