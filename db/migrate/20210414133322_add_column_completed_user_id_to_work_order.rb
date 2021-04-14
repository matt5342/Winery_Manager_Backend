class AddColumnCompletedUserIdToWorkOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :work_orders, :completer_user_id, :integer
  end
end
