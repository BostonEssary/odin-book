class FriendRequest < ApplicationRecord
    belongs_to :user
    belongs_to :requestee, class_name: "User"
    has_noticed_notifications
   

    
end
