class AnswersController < ApplicationController

  before_action :answer_find, only: [:edit, :update]

  def new
    @answer = Answer.new
    @quest = Quest.find(params[:quest_id])
  end

  def create
    Answer.create(answer_params)
    redirect_to quest_path(params[:quest_id]), notice: '解答しました'
  end

  def edit
  end

  def update
    @answer.update(answer_params)
    redirect_to quest_path(@quest.id), notice: '解答を編集しました'
  end

  private
  def answer_params
    params.require(:answer).permit(:plan, :text).merge(quest_id: params[:quest_id], user_id: current_user.id)
  end

  def answer_find
    @quest = Quest.find(params[:quest_id])
    @answer = Answer.find(params[:id])
  end

end