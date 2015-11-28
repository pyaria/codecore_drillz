class DrillGroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def new
    @dg = DrillGroup.new
  end

  def create
    dg_params = params.require(:drill_group).permit([:name, :description, :level])
    dg = DrillGroup.new dg_params
    if dg.save
      redirect_to drill_group_path(dg)
    else
      redirect_to drill_groups_path
    end
  end

  def show
    @dg = DrillGroup.find params[:id]
    @drills = @dg.drills.order(created_at: :desc)
    @drill = Drill.new
  end

  def index
    @drill_groups = DrillGroup.order(updated_at: :desc)
  end





end
