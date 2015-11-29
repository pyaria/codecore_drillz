class DrillCompletesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :update]
  before_action :find_drill, only: [:create]

  #//@drill, params [description]
  def create
    @drillcomplete = DrillComplete.new
    drill_answers = @drill.answers
    user_answer = params[:description]
    drill_answers.each do |answer|
      if answer == user_answer
        drillcomplete = current_user.drillcompletes.new
        drillcomplete.drill = @drill
        if drillcomplete.save
          alert("You got it right!")
          redirect_to drill_group_drill_path(@drill.drill_group, @drill)
          return
        else
          alert("Something's wrong.. please try again later")
          redirect_to drill_group_drill_path(@drill.drill_group, @drill)
          return
        end
      else
        flash[:alert] = "Wrong answer! Try again"
        redirect_to drill_group_drill_path(@drill.drill_group, @drill)
        return
      end
    end
  end

  private

  def find_drill
    @drill = Drill.find params[:drill_id]
  end

end
