class ChangeColumnNameInWorkOrder < ActiveRecord::Migration[6.1]
  def change
    rename_column :work_orders, :type, :name
  end
end
