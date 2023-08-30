class ChangeDistanceToEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :travel_time
    add_column :events, :distance, :integer
  end
end
