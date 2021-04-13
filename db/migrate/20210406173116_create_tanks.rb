class CreateTanks < ActiveRecord::Migration[6.1]
  def change
    create_table :tanks do |t|
      t.string :name
      t.string :material
      t.text :status
      t.integer :xaxis
      t.integer :yaxis
      t.integer :width
      t.integer :height
      t.integer :volume
      t.references :section, null: false, foreign_key: true
      t.timestamps
    end
  end
end
