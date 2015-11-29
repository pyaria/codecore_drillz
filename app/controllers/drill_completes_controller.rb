class DrillCompletesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :update]
  before_action :find_drill, only: [:create]

  #//@drill, params [description]
  def create
    user_answer = params[:drill_complete][:new_answer]
    @drillcomplete = DrillComplete.new
    drill_answers = @drill.answers
    drill_answers.each do |answer|
      if answer.description == user_answer
        drillcomplete = DrillComplete.new
        drillcomplete.user = current_user
        drillcomplete.drill = @drill
        if drillcomplete.save
          flash[:notice] = "You got it right!"
          redirect_to drill_group_drill_path(@drill.drill_group, @drill)
          return
        else
          flash[:alert] = "Something's wrong.. Please submitting again."
          redirect_to drill_group_drill_path(@drill.drill_group, @drill)
          return
        end
      end
    end
    flash[:alert] = "Wrong answer! Try again."
    redirect_to drill_group_drill_path(@drill.drill_group, @drill)
  end

  private

  def find_drill
    @drill = Drill.find params[:drill_id]
  end

end
