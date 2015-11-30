class DrillCompletesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :edit, :update]
  before_action :find_drill, only: [:create]

  #//@drill, params [description]
  def create
    user_answer = params[:drill_complete][:new_answer]
    @drillcomplete = DrillComplete.new
    @answers = @drill.answers
    @answers.each do |answer|
      continue = false
      if answer.type_of == 0
        continue = true if answer.description == user_answer
      elsif answer.type_of == 1
        reg = Regexp.new answer.description
        continue = true if reg === user_answer
      else

      end
      if continue
        @dg = @drill.drill_group
        @answer = Answer.new
        @show_answers = true
        drillcomplete = DrillComplete.new
        drillcomplete.user = current_user
        drillcomplete.drill = @drill
        if drillcomplete.save
          # see if user can get a badge
          badge = true
          @dg.drills.each do |drill|
            next if drill == @drill
            if !current_user.drill_completes.exists?(drill_id: drill)
              badge = false
              break
            end
          end

          if badge
            @dg.badges.each do |badge|
              ub = UserBadge.new
              ub.user = current_user
              ub.badge = badge
              ub.save
            end
          end

          # give the user points
          current_user.points = 0 unless current_user.points
          current_user.points += @drill.points
          current_user.save


          flash[:notice] = "You got it right!"
          render 'drills/show'
          return
        else
          flash[:notice] = "You got it right again!"
          render 'drills/show'
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
