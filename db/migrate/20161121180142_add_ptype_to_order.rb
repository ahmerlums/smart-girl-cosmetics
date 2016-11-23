class AddPtypeToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :Ptype, :string
  end
end
