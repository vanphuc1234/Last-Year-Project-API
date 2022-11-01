class DropBookAuthorsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :books
    drop_table :authors
  end
end
