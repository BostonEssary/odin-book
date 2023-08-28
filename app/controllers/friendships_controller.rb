class FriendshipsController < ApplicationController
    
    def new
        @friendship = Friendship.new()
    end

    def create
        @user = current_user
        @friend = User.find(params[:id])

        friendship_params = {user: @user, friend: @friend}

        @friendship = @user.friendships.new(friendship_params)

        if @friendship.save
            redirect_to users_path
        end
    end

    def destroy
        Friendship.destroy(params[:friendship])
        redirect_to users_path
    end
end
