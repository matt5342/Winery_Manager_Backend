class ChangeWorkOrderColumnNameAndAddColumn < ActiveRecord::Migration[6.1]
  def change
    rename_column :work_orders, :tank_id, :exit_tank
    add_column :work_orders, :enter_tank, :string
  end
end
