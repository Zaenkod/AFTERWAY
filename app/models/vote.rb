class Vote < ApplicationRecord
  belongs_to :participant
  belongs_to :event_bar
end
