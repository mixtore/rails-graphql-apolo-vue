class CreateProductVariant < ActiveRecord::Migration[5.2]
  def change
    create_table :product_variants do |t|
      t.belongs_to :product, index: true
      t.string :name
      t.string :description
      t.string :slug
      t.string :barcode
      t.string :option1
      t.string :option2
      t.string :option3
      t.float :price
      t.timestamps
    end
  end
end
