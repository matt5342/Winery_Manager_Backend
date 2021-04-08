class CreateActions < ActiveRecord::Migration[6.1]
  def change
    create_table :actions do |t|
      t.string :name
      t.text :notes
      t.datetime :ordered
      t.integer :ordered_by
      t.datetime :completed
      t.integer :completed_by
      t.integer :lot_id
      t.integer :tank_id

      t.timestamps
    end
  end
end
