class CreateOwners < ActiveRecord::Migration[6.1]
  def change
    create_table :owners do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :winery_name

      t.timestamps
    end
  end
end
