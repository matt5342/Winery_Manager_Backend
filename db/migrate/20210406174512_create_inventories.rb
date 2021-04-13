class CreateInventories < ActiveRecord::Migration[6.1]
  def change
    create_table :inventories do |t|
      t.string :format
      t.integer :quantity
      t.integer :lot_id
      t.references :owner, null: false, foreign_key: true
      t.timestamps
    end
  end
end
