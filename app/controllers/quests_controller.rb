class QuestsController < ApplicationController
  before_action :move_to_index, except: [:index, :show,]
  before_action :set_quest, only: [:show, :destroy]

  def new
    @quest = Quest.new
  end

  def create
    quest = Quest.new(quest_params)
    if quest.save
      redirect_to root_path, notice: 'クエストを発注しました'
    else
      redirect_to new_quest_path, notice: '必須事項を入力してください'
    end
  end

  def index
    @quests = Quest.includes(:user).order("created_at DESC")
  end

  def show
    @answer = Answer.new
    @answers = @quest.answers.includes(:user).order("created_at DESC")
  end

  def destroy
    @quest.destroy
    redirect_to root_path, notice: 'クエストを削除しました'
  end

  private
  def quest_params
    params.require(:quest).permit(:title).merge(user_id: current_user.id)
  end

  def set_quest
    @quest = Quest.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
