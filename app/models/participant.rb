class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :votes

  after_commit :push_notification, on: :create

  # Méthode qui permet de demander à un participant si l'utilisateur participant à deja voté pour un bar
  def voted_for?(event_bar)
    Vote.find_by(participant: self, event_bar: event_bar)
  end

  private

  def push_notification
    # Créer une notification
    notification = Notification.create(recipient_id: user_id, event_id: event_id )
    notification_html = ApplicationController.renderer.render_to_string(partial: 'shared/notifications', locals: {notification: notification}, formats: :html)
    NotificationsChannel.broadcast_to(user, notification_html)
  end
end
