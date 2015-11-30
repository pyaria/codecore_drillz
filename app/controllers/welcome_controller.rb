class WelcomeController < ApplicationController

  def index
  end

  def dashboard
    @user = current_user
    @points = current_user.points
    @badges = current_user.badges
  end

end
