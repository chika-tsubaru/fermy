class AnswersController < ApplicationController

  def new
    @answer = Answer.new
    @quest = Quest.find(params[:quest_id])
  end

  def create
    Answer.create(answer_params)
    # binding.pry
    redirect_to quest_path(params[:quest_id])
  end

  private
  def answer_params
    params.require(:answer).permit(:plan, :text).merge(quest_id: params[:quest_id])
  end

end