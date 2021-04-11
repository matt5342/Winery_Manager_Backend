class AddHeightToTanks < ActiveRecord::Migration[6.1]
  def change
    add_column :tanks, :height, :integer
  end
end
