  class OmniauthCallbacksController < Devise::OmniauthCallbacksController

    def github
      puts env["omniauth.auth"]
      @user = User.find_or_create_for_github(env["omniauth.auth"])

      if @user.persisted?
        flash[:notice] = t('devise.sessions.signed_in')
        sign_in_and_redirect @user, event: :authentication
      else
        redirect_to new_user_registration_url
      end
    end
    # This is solution for existing accout want bind Google login but current_user is always nil
    # https://github.com/intridea/omniauth/issues/185
    def handle_unverified_request
      true
    end
  end
