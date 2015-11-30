class ProfileController < ApplicationController
  before_action :authenticate_user!, only: [:show]

  def update
    user = current_user
    user.update params.require(:users).permit(:profile_pic)
    redirect_to profile_path
  end


  def show
  
  end

end
