class DrillCompletesController < ApplicationController

  #//@drill, params [description]
  def create
    drill_answers = @drill.answers.to_a
    user_answer = params[:description]
    drill_answers.each do |answer|
      if answer == user_answer
        drillcomplete = current_user.drillcompletes.new
        drillcomplete.drill = @drill
        if drillcomplete.save
          alert("You got it right!")
          redirect_to drill_group_drill_path(@drill.drill_group_id, @drill)
        else
          alert("Something's wrong.. please try again later")
        end
      else
        alert("Wrong answer! Try again :)")
      end
    end
    drillcomplete = Drillcomplete.new

  end

end
