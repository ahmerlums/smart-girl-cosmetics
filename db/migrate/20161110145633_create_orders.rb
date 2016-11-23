class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :productID
      t.integer :customerID
      t.string :status
      t.date :dateOrdered
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
