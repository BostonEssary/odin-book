class RegistrationsController < Devise::RegistrationsController

    def create
      super
      if @user.persisted?
        UserMailer.with(user: @user).welcome_email.deliver
      end
    end
  
  end
  