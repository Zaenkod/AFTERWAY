class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :user
  has_many :votes

  # Méthode qui permet de demander à un participant si l'utilisateur participant à deja voté pour un bar
  def voted_for?(event_bar)
    Vote.find_by(participant: self, event_bar: event_bar)
  end
end
