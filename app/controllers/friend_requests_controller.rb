class FriendRequestsController < ApplicationController

    def new
        @friend_request = FriendRequest.new()
    end

    def create
        @user = current_user
        @requestee = User.find(params[:id])

        friend_request_params = {user: @user, requestee: @requestee}

        @friend_request = @user.friend_requests.new(friend_request_params)

        if @friend_request.save
            FriendRequestNotification.with(friend_request: @friend_request).deliver(@requestee)
            redirect_to users_path
        end
    end

    def index

        @requests = FriendRequest.where(requestee_id: current_user.id)

    end

    def destroy

        FriendRequest.destroy(params[:friend_request])
        redirect_to users_path

    end
end
