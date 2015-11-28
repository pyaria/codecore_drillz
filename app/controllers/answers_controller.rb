class AnswersController < ApplicationController

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new answer_params
    if @answer.save
      alert("Answer saved!")
    else
      alert("Answer not saved!")
    end
  end

  def edit

  end

  def update
    @answer = Answer.find params[:id]
    if @answer.update
      alert("Answer updated!")
    else
      alert("Answer not updated!")
    end
  end

  def destroy
    @answer.destroy
    alert("Answer destroyed!")
  end

  private
  def answer_params
    params.require(:answer).permit([:description])
  end

end
