class AddRepositoryIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :repository_id, :integer
  end
end
