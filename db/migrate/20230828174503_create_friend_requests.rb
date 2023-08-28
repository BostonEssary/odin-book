class CreateFriendRequests < ActiveRecord::Migration[7.0]
  def change
    create_table :friend_requests do |t|
      t.references :user, index: true
      t.references :requestee, index: true

      t.timestamps
    end
    add_foreign_key :friend_requests, :users
  end
end
