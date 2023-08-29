class Event < ApplicationRecord
  belongs_to :user
  has_many :event_bars
  has_many :bars, through: :event_bars
  has_many :participants
  has_many :users, through: :participants, source: :user
  validates :title, :date, :address, :travel_time, presence: true

  def geocode_center
    addresses_particpants = User.where(id: participants.pluck(:user_id)).pluck(:address)
    Geocoder::Calculations.geographic_center(addresses_particpants)
  end
end
