class ChangeUserIdiDtoUserId < ActiveRecord::Migration
  def change
    rename_column :groups, :userID_id, :user_id
  end
end
