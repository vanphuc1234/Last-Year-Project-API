class CreateSaves < ActiveRecord::Migration[6.1]
  def change
    create_table :saves do |t|
      t.belongs_to :product, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
