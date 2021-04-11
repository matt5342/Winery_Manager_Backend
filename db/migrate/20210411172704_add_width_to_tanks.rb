class AddWidthToTanks < ActiveRecord::Migration[6.1]
  def change
    add_column :tanks, :width, :integer
  end
end
