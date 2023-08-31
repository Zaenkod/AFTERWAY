class EventBar < ApplicationRecord
  belongs_to :event
  belongs_to :bar
  has_many :votes, dependent: :destroy
end
