class AddFriendsToUsers < ActiveRecord::Migration[7.0]
  def change
    t.references :user, index: true
    t.references :friend, index: true
  end
end
