class AddAPITokenToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :api_token, :string
    add_index :users, :api_token
    add_index :users, [:username, :password]
  end
end
