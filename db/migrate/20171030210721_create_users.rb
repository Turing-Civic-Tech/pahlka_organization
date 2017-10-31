class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :uid
      t.string :email
      t.string :image_path

      t.timestamps
    end
  end
end
