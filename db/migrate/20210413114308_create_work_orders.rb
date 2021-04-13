class CreateWorkOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :work_orders do |t|
      t.string :type
      t.text :notes
      t.string :status
      t.references :lot, null: false, foreign_key: true
      t.integer :tank_id
      t.integer :user_id

      t.timestamps
    end
  end
end
