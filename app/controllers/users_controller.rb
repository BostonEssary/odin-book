class UsersController < ApplicationController
    def index
        @users = User.all()
    end

    def show
        @user = User.find(params[:id])
        @friendship = Friendship.where(user_id: current_user.id, friend_id: params[:id]).first
        @friend_request = FriendRequest.where(user_id: current_user.id, requestee_id: params[:id]).first
    end
end
