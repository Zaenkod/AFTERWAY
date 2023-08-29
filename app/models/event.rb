class Event < ApplicationRecord
  belongs_to :user
  has_many :participants
  validates :title, :date, :address, :travel_time, presence: true
end
