class AnswersController < ApplicationController



  def index

  end

  def create
    @answers = Answer.create(answers_params)
    redirect_to "#"
  end

  private
  def answers_params
    params.require(:answer).permit(:plan, :text).merge(user_id: user.id, quest_id: params[:quest_id])
  end

end
