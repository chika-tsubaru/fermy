class AnswersController < ApplicationController

  before_action :answer_find, only: [:edit, :update]
  before_action :move_to_signup

  def new
    @answer = Answer.new
    @quest = Quest.find(params[:quest_id])
  end

  def create
    answer = Answer.new(answer_params)
    if answer.save
      redirect_to quest_path(params[:quest_id]), notice: '解答しました'
    else
      redirect_to new_quest_answer_path, notice: '必須項目を入力してください'
    end
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

  private
  def move_to_signup
    unless user_signed_in?
      redirect_to new_user_registration_path, notice: '解答するには新規登録が必要です'
    end 
  end
end