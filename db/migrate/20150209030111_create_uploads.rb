class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :filename
      t.integer :purchase_count
      t.float :total
      t.text :content

      t.timestamps null: false
    end
  end
end
