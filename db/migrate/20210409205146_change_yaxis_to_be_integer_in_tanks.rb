class ChangeYaxisToBeIntegerInTanks < ActiveRecord::Migration[6.1]
  def change
    change_column :tanks, :yaxis, :integer
  end
end
