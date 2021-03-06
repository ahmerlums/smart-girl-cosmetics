class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
      t.string :password_salt
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :city

      t.timestamps null: false
    end
  end
end
