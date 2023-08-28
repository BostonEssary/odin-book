class AddFriendships < ActiveRecord::Migration[7.0]
  def change
    create_table :friendships do |t|
      t.references :user, index: true
      t.references :friend, index: true
      t.timestamps
    end
    add_foreign_key :friendships, :users
  end
end
