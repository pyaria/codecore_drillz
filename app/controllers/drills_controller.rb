class DrillsController < ApplicationController
  #before_action :authenticate_user, only: [:create, :destroy, :edit, :update]

  def create
    drill_params = params.require(:drill).permit(:body)
    @drill_group = DrillGroup.find params[:drill_group_id]
    @drill = Drill.new drill_params
    @drill.drill_group = @drill_group
    #@drill.user = current_user

    respond_to do |format|
      if @drill.save
        format.html { redirect_to drill_group_path(@drill_group), notice: "Drill created succussfully!" }
        format.js { render :create_success }
      else
        @drills = @drill_group.drills.order(created_at: :desc)
        format.html { render "drill_groups/show" }
        format.js { render :create_failure }
      end
    end
  end

  def edit
    @drill_group = DrillGroup.find_by_id params[:drill_group_id]
    @drill = Drill.find_by_id params[:id]
    respond_to do |format|
      redirect_to drill_group_path(@drill_group), alert: "Access denied." and return unless can? :edit, @drill
      format.js { render }
    end
  end

  def update
    drill_params = params.require(:drill).permit(:name, :description)
    @drill_group = DrillGroup.find params[:drill_group_id]
    @drill = Drill.find params[:id]
    respond_to do |format|
      if @drill.update(drill_params)
        format.html { redirect_to drill_group_path(@drill_group), notice: "Drill updated!" }
        format.js { render :update_success }
      else
        @drills = @drill_group.drills.order(created_at: :desc)
        @assets = @drill_group.assets.order(created_at: :desc)
        format.html { render "drill_groups/show" }
        format.js { render :update_failure }
      end
    end
  end

  def destroy
    @drill = Drill.find_by_id params[:id]
    respond_to do |format|
      if @drill
        redirect_to drill_group_path(params[:drill_group_id]), alert: "Access denied." and return unless can? :destroy, @drill
        @drill.destroy
        format.html { redirect_to drill_group_path(drill.drill_group), notice: "Drill deleted" }
        format.js { render }
      else
        format.html { redirect_to drill_group_path(params[:drill_group_id]), notice: "Drill already deleted" }
      end
    end
  end

  def show
    @drill = Drill.find_by_id params[:id]
  end


end
