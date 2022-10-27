class CreateProductImages < ActiveRecord::Migration[6.1]
  def change
    create_table :product_images do |t|
      t.belongs_to :product, index: true
      t.string :photo
      
      t.timestamps
    end
  end
end
