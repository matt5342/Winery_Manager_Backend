class CreateTanks < ActiveRecord::Migration[6.1]
  def change
    create_table :tanks do |t|
      t.string :name
      t.string :material
      t.text :status
      t.decimal :xaxis
      t.decimal :yaxis

      t.timestamps
    end
  end
end
