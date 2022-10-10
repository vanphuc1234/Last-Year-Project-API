class AddColumnTypeuserToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :type_user, :string
  end
end
