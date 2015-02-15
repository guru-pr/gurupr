module Admin
  class AccessesController < ApplicationController
    before_action :authenticate_admin!

    def create
      @user = User.normal.find(params[:user_id])
      @user.update admin: true
      redirect_to admin_users_path
    end

    def destroy
      @user = User.admin.find(params[:user_id])
      @user.update admin: false
      redirect_to admin_users_path
    end
  end
end
