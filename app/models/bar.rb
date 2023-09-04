class Bar < ApplicationRecord
  has_many :event_bars
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_one_attached :photo

  validates :name, :address, :description, presence: true
end
