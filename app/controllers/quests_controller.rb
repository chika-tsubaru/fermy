class QuestsController < ApplicationController
  before_action :move_to_index, except: [:index, :show,]
  before_action :set_quest, only: [:show, :destroy]

  def new
    @quest = Quest.new
  end

  def create
    Quest.create(quest_params)
    redirect_to root_path, notice: 'クエストを発注しました'
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
