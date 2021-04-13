class CreateLots < ActiveRecord::Migration[6.1]
  def change
    create_table :lots do |t|
      t.string :name
      t.integer :volume
      t.integer :vintage
      t.text :status
      t.string :color
      t.references :owner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
