class RemoveCellphoneFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :cellphone, :integer
  end
end
