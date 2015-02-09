class AddTotalToPurchase < ActiveRecord::Migration
  def change
  	add_column :purchases, :total, :float
  end
end
