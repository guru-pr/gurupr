class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :admin_signed_in?
  helper_method :authenticate_admin!
  helper_method :title

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
    title = @title || t('.title')
    title = @title || t('.title', options)

    "#{title} - #{t('layouts.application.title_suffix')}"
  end

  def options
    record.present? ? { name: record.name } : {}
  end

  def record
    instance_variable_get("@#{controller_name.singularize}".to_sym)
  end
end
