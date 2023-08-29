class AddDataToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :hour, :time
    add_column :events, :travel_time, :integer
    add_column :events, :category, :string
    add_column :events, :price, :integer
  end
end
