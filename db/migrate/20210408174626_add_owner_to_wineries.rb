class AddOwnerToWineries < ActiveRecord::Migration[6.1]
  def change
    add_reference :wineries, :owner, null: false, foreign_key: true
  end
end
