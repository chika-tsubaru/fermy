class QuestsController < ApplicationController
  before_action :move_to_index, except: [:index, :show,]

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
    @quests = Quest.find(params[:id])
    @answers = @quests.answer.includes(:user)
  end

  private
  def quest_params
    params.require(:quest).permit(:title)
  end
end
