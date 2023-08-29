class UpdateNameToEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, :name
    add_column :events, :title, :string
  end
end
