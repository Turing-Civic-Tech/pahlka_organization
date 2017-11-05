class CreateGraphData < ActiveRecord::Migration[5.1]
  def change
    create_table :graph_data do |t|
      t.json :commits
      t.json :add_delete

      t.timestamps
    end
  end
end
