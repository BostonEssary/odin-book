class AddFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.references :user, foreign_key: true
      t.references :friend, index: true
      t.timestamps
    end
  end
end
