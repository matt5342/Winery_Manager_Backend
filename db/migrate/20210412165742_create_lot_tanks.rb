class CreateLotTanks < ActiveRecord::Migration[6.1]
  def change
    create_table :lot_tanks do |t|
      t.references :lot, null: false, foreign_key: true
      t.references :tank, null: false, foreign_key: true
      t.integer :volume

      t.timestamps
    end
  end
end
