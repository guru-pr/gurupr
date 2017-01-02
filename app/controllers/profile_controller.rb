class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def update
    current_user.update_attributes(profile_params)
  end

  private

  def profile_params
    params.require(:profile).permit(:name)
  end
end
