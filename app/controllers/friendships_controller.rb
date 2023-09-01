class FriendshipsController < ApplicationController
    
    def new
        @friendship = Friendship.new()
    end

    def create
        @user = current_user
        @friend = User.find(params[:id])

        friendship_params = {user: @user, friend: @friend}
        inverse_friendship_params = {user: @friend, friend: @user}

        @friendship = @user.friendships.new(friendship_params)
        @inverse_friendship = @friend.friendships.new(inverse_friendship_params)

        if @friendship.save && @inverse_friendship.save
            FriendRequest.destroy(params[:request])
            redirect_to users_path
        end
    end

    def destroy
        @friendship = params[:friendship]
        @inverse_friendship = params[:inverse_friendship]
        Friendship.destroy(@friendship)
        Friendship.destroy(@inverse_friendship )
        redirect_to users_path
    end
end
