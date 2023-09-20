class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :configure_permitted_parameters, if: :devise_controller?

    helper_method :current_user

    protected

    def configure_permitted_parameters
        attributes = [:name, :bio, :location, :email, :avatar]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end

    def user_root_path
        profile_url
    end
end
