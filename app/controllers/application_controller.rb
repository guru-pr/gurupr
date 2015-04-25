class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :authenticate_admin!
  helper_method :title

  def default_url_options(options = {})
    { locale: I18n.locale }
  end

  private

  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue Exception => e
      nil
    end
  end

  def admin_signed_in?
    user_signed_in? and current_user.admin?
  end

  def authenticate_admin!
    redirect_to :root unless admin_signed_in?
  end

  def user_signed_in?
    current_user.present?
  end

  def title
    return "#{@title} - #{t('layouts.application.title_suffix')}" if @title.present?

    t('layouts.application.title')
  end
end
