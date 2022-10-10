class AddColumnProduct < ActiveRecord::Migration[6.1]
  def change
      add_column :products, :city, :string
      add_column :products, :district, :string
      add_column :products, :ward, :string
      add_column :products, :street, :string
      add_column :products, :facade, :integer
      add_column :products, :floor_count, :integer
  end
end
