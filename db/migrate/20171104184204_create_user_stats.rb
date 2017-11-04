class CreateUserStats < ActiveRecord::Migration[5.1]
  def change
    create_table :user_stats do |t|
      t.references :user, foreign_key: true
      t.integer :lines_added
      t.integer :lines_deleted
      t.integer :commits

      t.timestamps
    end
  end
end
