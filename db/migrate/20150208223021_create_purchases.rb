class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :purchaser_name
      t.integer :count
      t.references :item, index: true

      t.timestamps null: false
    end
    add_foreign_key :purchases, :itens
  end
end
