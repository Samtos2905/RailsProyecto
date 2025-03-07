class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :brand
      t.integer :stock
      t.decimal :weight
      t.string :origin

      t.timestamps
    end
  end
end
