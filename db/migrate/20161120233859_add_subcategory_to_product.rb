class AddSubcategoryToProduct < ActiveRecord::Migration
  def change
    add_column :products, :subcategory, :string
  end
end
