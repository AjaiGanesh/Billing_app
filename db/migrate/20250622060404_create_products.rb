class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :product_code, null: false
      t.integer :stock, null: false, default: 0
      t.float :price, null: false
      t.float :tax, null: false

      t.timestamps
    end
    add_index :products, :product_code, unique: true
  end
end
