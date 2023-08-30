class RemoveVotesToEventBar < ActiveRecord::Migration[7.0]
  def change
    remove_column :event_bars, :vote
  end
end
