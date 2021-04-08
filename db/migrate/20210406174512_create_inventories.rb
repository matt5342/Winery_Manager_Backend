class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.string :format
      t.integer :quantity
      t.integer :lot_id

      t.timestamps
    end
  end
end
