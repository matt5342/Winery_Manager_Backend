class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :priveledges

      t.timestamps
    end
  end
end
