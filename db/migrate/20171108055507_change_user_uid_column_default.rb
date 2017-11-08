class ChangeUserUidColumnDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :uid, 12345
  end
end
