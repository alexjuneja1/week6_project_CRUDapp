class ChangeUserIdiDtoUserId < ActiveRecord::Migration
  def change
    rename_column :groups, :user_id, :user_id
  end
end
