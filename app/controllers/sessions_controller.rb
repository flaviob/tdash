class SessionsController < ApplicationController
  def create
    # Get access tokens from the google server
    access_token = request.env["omniauth.auth"]
    user = User.from_omniauth(access_token)
    
    if user.persisted?
      sign_in_and_redirect user, event: :authentication
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      session["devise.google_data"] = access_token
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path, alert: "Authentication failed, please try again."
  end
end