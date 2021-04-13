class AddStatusToActions < ActiveRecord::Migration[6.1]
  def change
    add_column :actions, :status, :string
  end
end
