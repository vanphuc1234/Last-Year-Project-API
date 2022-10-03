class AddDiretionBedsBathsToProducts < ActiveRecord::Migration[6.1]
  def change
    

        add_column :products, :direction, :string
        add_column :products, :beds_count, :integer
        add_column :products, :baths_count, :integer
    
  end
end
