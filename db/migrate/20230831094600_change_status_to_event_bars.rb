class ChangeStatusToEventBars < ActiveRecord::Migration[7.0]
  def change
    change_column_default :event_bars, :status, "Not booked"
  end
end
