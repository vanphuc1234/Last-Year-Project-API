class AddColumnUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :job_title, :string
    add_column :users, :phone, :integer
    add_column :users, :sex, :string
    add_column :users, :experience_year, :string
  end
end
