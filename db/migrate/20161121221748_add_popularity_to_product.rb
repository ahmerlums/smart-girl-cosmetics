class AddPopularityToProduct < ActiveRecord::Migration
  def change
    add_column :products, :popularity, :Integer
  end
end
