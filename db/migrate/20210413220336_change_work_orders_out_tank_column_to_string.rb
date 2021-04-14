class ChangeWorkOrdersOutTankColumnToString < ActiveRecord::Migration[6.1]
  def change
    change_column :work_orders, :out_tank, :string
  end
end
