class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :tittle
      t.string :Type
      t.float :Price
      t.text :Information
      t.string :image
      t.string :delivery_time

      t.timestamps null: false
    end
  end
end
