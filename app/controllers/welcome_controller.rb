class WelcomeController < ApplicationController
  def index
    @members = User.order(:name)
  end
end
