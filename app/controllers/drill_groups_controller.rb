class DrillGroupsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :find_drill_group, only: [:show, :edit, :update, :destroy]


  def new
    @dg = DrillGroup.new
  end

  def create
    redirect_to drill_groups_path, alert: "Access denied." and return unless current_user.admin?
    @dg = DrillGroup.new dg_params
    @dg.user = current_user
    category_names = params[:drill_group][:category_ids].split(", ")
    category_ids = []
    category_names.each do |category|
      Category.create(name: category) unless Category.find_by_name(category)
      category_ids.push(Category.find_by_name(category).id)
    end
    @dg.category_ids = category_ids
    if @dg.save
      redirect_to drill_group_path(@dg)
    else
      redirect_to drill_groups_path
    end
  end

  def show
    @dg = DrillGroup.find params[:id]
    @drills = @dg.drills.order(created_at: :desc)
    @drill = Drill.new
    @categories = @dg.categories
  end

  def index
    @drill_groups = DrillGroup.order(updated_at: :desc)
  end

  def edit
    redirect_to drill_group_path(@dg), alert: "Access denied." and return unless can? :edit, @dg
  end

  def update
    redirect_to drill_group_path(@dg), alert: "Access denied." and return unless can? :update, @dg
    category_names = params[:drill_group][:category_ids].split(", ")
    category_ids = []
    category_names.each do |category|
      Category.create(name: category) unless Category.find_by_name(category)
      category_ids.push(Category.find_by_name(category).id)
    end
    if @dg.update dg_params
      @dg.category_ids = category_ids
      @dg.save
      redirect_to(drill_group_path(@dg))
    else
      render :edit
    end
  end

  def destroy
    redirect_to drill_group_path(@dg), alert: "Access denied." and return unless can? :destroy, @dg
    @dg.destroy
    flash[:notice] = "Drill group deleted successfully"
    redirect_to drill_groups_path
  end

  private

  def dg_params
    params.require(:drill_group).permit(:name, :description, :level, {badge_ids: []}, {category_ids: []})
  end

  def find_drill_group
    @dg = DrillGroup.find params[:id]
  end

end
