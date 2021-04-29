class DropFriends < ActiveRecord::Migration[6.1]
  def change
    drop_table :friends do |t|
      t.references :user, null: false, foreign_key: true
      t.references :friend, references: :users, foreign_key: {to_table: :users}

      t.timestamps 
    end 
  end
end
