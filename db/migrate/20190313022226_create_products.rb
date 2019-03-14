class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.belongs_to :brand, index: true
      t.string :name, null: false
      t.decimal :price, null: false
      t.string :options

      t.timestamps
    end
  end
end
