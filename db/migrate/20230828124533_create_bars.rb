class CreateBars < ActiveRecord::Migration[7.0]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.integer :price
      t.string :category
      t.string :description
      t.string :picture
      t.float :rating

      t.timestamps
    end
  end
end
