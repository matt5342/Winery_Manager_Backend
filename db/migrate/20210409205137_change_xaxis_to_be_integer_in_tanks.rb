class ChangeXaxisToBeIntegerInTanks < ActiveRecord::Migration[6.1]
  def change
    change_column :tanks, :xaxis, :integer
  end
end
