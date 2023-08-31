class Bar < ApplicationRecord
  has_many :event_bars
  geocoded_by :address
  has_one_attached :photo

  validates :name, :address, :description, presence: true
end
