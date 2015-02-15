module Admin
  class UsersController < ApplicationController
    before_action :authenticate_admin!

    def index
      @admins = User.admin
      @users  = User.normal
    end
  end
end
