class UsersController < ApplicationController
    before_action :authenticate_user!
    def index
        @users = User.all()
        @user_friends = current_user.friends
    end

    def show
        @user = User.find(params[:id])
        @friend_request = FriendRequest.where(user_id: current_user.id, requestee_id: params[:id]).first
        @friendship = Friendship.where(user_id: current_user.id, friend_id: @user).first
        @inverse_friendship = Friendship.where(user_id: @user, friend_id: current_user.id).first
    end
end
