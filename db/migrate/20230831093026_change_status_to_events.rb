class ChangeStatusToEvents < ActiveRecord::Migration[7.0]
  def change
    change_column_default :events, :status, "Not booked"
  end
end
