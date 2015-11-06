class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :topic
      t.date :date
      t.string :location
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
