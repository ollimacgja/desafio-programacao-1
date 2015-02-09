class CreateItens < ActiveRecord::Migration
  def change
    create_table :itens do |t|
      t.string :description
      t.float :price
      t.references :merchant, index: true

      t.timestamps null: false
    end
    add_foreign_key :itens, :merchants
  end
end
