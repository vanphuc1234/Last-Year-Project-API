class CreateProductImages < ActiveRecord::Migration[6.1]
  def change
    create_table :product_images do |t|
      t.integer :product_id, index: true
      t.timestamps
    end
  end
end
