class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, :last_name, :address, presence: true
  has_many :events, dependent: :destroy
  has_many :participants

  has_many :events_as_participant, through: :participants, source: :event
  has_many :notifications, foreign_key: :recipient_id, class_name: 'Notification'
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def unique_user
    "#{first_name} #{last_name}"
  end

  def find_participant(event)
    event.participants.find_by(user: self)
  end

  def participations
    # events_as_participant.reject { |ev| ev.user == self }
    events_as_participant.where.not(user: self)
  end
end
