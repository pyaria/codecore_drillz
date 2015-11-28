class DrillGroupsController < ApplicationController

  def new
    @dg = DrillGroup.new
  end

  def create
    dg_params = params.require(:drill_group).permit([:name, :description, :level])
    dg = DrillGroup.new dg_params
    dg.user =current_user
    if dg.save
      redirect_to drill_group_path(dg)
    else
      redirect_to drill_groups_path
    end
  end

  def show
    @dg = DrillGroup.find params[:id]
  end

  def index
    @drill_groups = DrillGroup.all
  end

end
