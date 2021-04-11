class AddWineryToTanks < ActiveRecord::Migration[6.1]
  def change
    add_reference :tanks, :winery, null: false, foreign_key: true
  end
end
