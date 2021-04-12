class AddLotToOwner < ActiveRecord::Migration[6.1]
  def change
    add_reference :lots, :owner, null: false, foreign_key: true
  end
end
