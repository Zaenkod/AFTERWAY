class Event < ApplicationRecord
  belongs_to :user
  has_many :participants
  validates :name, :date, presence: true
end
