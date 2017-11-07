class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :image_path
      t.string :title
      t.string :description
      t.string :github_link
      t.string :heroku_link
      t.string :status, :default => 'Proposed'

      t.timestamps
    end
  end
end
