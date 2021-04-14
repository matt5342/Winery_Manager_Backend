class ChangeWorkOrderColumnNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :work_orders, :exit_tank, :out_tank
    rename_column :work_orders, :enter_tank, :in_tank
  end
end
