class SessionsController < ApplicationController
  def create
    creator = SessionCreator.new(request.env['omniauth.auth'])
    session[:user_id] = creator.user.id if creator.call

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
