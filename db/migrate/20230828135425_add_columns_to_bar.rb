class AddColumnsToBar < ActiveRecord::Migration[7.0]
  def change
    add_column :bars, :opening_hours, :time
    add_column :bars, :closing_hours, :time
  end
end
