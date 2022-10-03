class AddFieldsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :business_type, :string
    add_column :products, :category_type, :string
    add_column :products, :price, :float
    add_column :products, :area, :float
  end
end
