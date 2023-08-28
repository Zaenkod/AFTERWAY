class Bar < ApplicationRecord
  has_many :event_bars
  validates :name, :address, :description, presence: true
end
