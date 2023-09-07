class ChangeColumnHoursToBars < ActiveRecord::Migration[7.0]
  def change
    change_column :bars, :opening_hours, :string
    change_column :bars, :closing_hours, :string
  end
end
