class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id, null: false
      t.integer :friend_id, null: false
      t.boolean :confirmed, null: false, default: false

      t.timestamps
    end

    add_index :friendship, :user_id
    add_index :friendship, [:user_id, :friend_id], unique: true
  end
end
