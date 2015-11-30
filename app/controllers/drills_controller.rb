class DrillsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :update]
  before_action :find_drill_group, only: [:create, :show, :edit, :update, :destroy]
  before_action :find_drill, only: [:show, :edit, :update, :destroy]

  def create
    redirect_to drill_group_path(@dg), alert: "Access denied." and return unless current_user.admin?
    @drill = Drill.new drill_params
    @drill.drill_group = @dg
    @drill.user = current_user
    respond_to do |format|
      if @drill.save
        format.html { redirect_to drill_group_path(@dg), notice: "Drill created successfully!" }
        format.js { render :create_success }
      else
        @drills = @dg.drills.order(created_at: :desc)
        format.html { render "drill_groups/show" }
        format.js { render :create_failure }
      end
    end
  end

  def edit
    @answer = Answer.new
    @answers = @drill.answers
    respond_to do |format|
      redirect_to drill_group_path(@dg), alert: "Access denied." and return unless can? :edit, @drill
      format.html { render }
      format.js { render }
    end
  end

  def update
    redirect_to drill_group_path(@dg), alert: "Access denied." and return unless can? :update, @drill
    respond_to do |format|
      if @drill.update(drill_params)
        format.html { redirect_to drill_group_drill_path(@dg, @drill), notice: "Drill updated!" }
        format.js { render :update_success }
      else
        @drills = @dg.drills.order(created_at: :desc)
        @answer = Answer.new
        @answers = @drill.answers
        format.html { render :edit }
        format.js { render :update_failure }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @drill
        redirect_to drill_group_path(params[:drill_group_id]), alert: "Access denied." and return unless can? :destroy, @drill
        @drill.destroy
        format.html { redirect_to drill_group_path(@drill.drill_group), notice: "Drill deleted" }
        format.js { render }
      else
        format.html { redirect_to drill_group_path(params[:drill_group_id]), notice: "Drill already deleted" }
      end
    end
  end

  def show
    @answer = Answer.new
    @answers = @drill.answers
    @drillcomplete = DrillComplete.new
  end

  private

  def drill_params
    params.require(:drill).permit(:name, :description, :points)
  end

  def find_drill_group
    @dg = DrillGroup.find params[:drill_group_id]
  end

  def find_drill
    @drill = Drill.find params[:id]
  end

end
