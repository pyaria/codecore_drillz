class UserDrillGroupsController < ApplicationController

  def create
    @udg   = current_user.user_drill_groups.new
    @dg     = DrillGroup.find params[:drill_group_id]
    @udg.drill_group = @dg
    respond_to do |format|
      if @udg.save
        format.html { redirect_to drill_groups_path, notice: "Added to My Drills!" }
        format.js { render :create_success }
      else
        format.html { redirect_to drill_groups_path, alert: "Error Occured!" }
      end
    end
  end


  def destroy
    @dg = DrillGroup.find params[:drill_group_id]
    @udg      = current_user.user_drill_groups.find params[:id]
    @udg.destroy
    respond_to do |format|
      format.html { redirect_to drill_group_path(@dg), notice: "Removed from My Drills!" }
      format.js { render }
    end
  end

  def index
    @user_drill_groups = current_user.user_drill_groups
  end

end
