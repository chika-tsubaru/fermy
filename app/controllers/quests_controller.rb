class QuestsController < ApplicationController
  before_action :move_to_index, except: [:index, :show,]
  before_action :set_quest, only: :show

  def new
    @quest = Quest.new
  end

  def create
    Quest.create(quest_params)
    redirect_to root_path
  end

  def index
    @quests = Quest.all.order("created_at DESC")
  end

  def show
    @answer = Answer.new
    @answers = @quest.answers.includes(:user)
  end

  private
  def quest_params
    params.require(:quest).permit(:title)
  end

  def set_quest
    @quest = Quest.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end

end
