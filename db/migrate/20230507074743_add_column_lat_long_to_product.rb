class AddColumnLatLongToProduct < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :lat, :float
    add_column :products, :lon, :float
  end
end
