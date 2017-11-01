class AddRepositoryIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :repository_name, :string
    add_column :users, :role, :string
  end
end
