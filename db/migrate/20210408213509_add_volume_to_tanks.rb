class AddVolumeToTanks < ActiveRecord::Migration[6.1]
  def change
    add_column :tanks, :volume, :integer
  end
end
