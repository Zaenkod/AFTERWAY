class Event < ApplicationRecord
  belongs_to :user
  has_many :event_bars, dependent: :destroy
  has_many :bars, through: :event_bars
  has_many :participants, dependent: :destroy
  has_many :users, through: :participants, source: :user
  has_many :notifications, dependent: :destroy
  validates :title, :date, :distance, :price, presence: true

  # def geocode_center
  #   addresses_particpants = User.where(id: participants.pluck(:user_id)).pluck(:address)
  #   Geocoder::Calculations.geographic_center(addresses_particpants)
  # end

  def users_by_status(status)
    participants.where(status: status).map(&:user)
  end
end
