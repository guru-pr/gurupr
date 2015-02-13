class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_or_create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to :root
  end

  def destroy
    reset_session

    redirect_to :root
  end

  def failure
    redirect_to :root
  end
end
