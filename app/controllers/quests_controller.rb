class QuestsController < ApplicationController

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

  private
  def quest_params
    params.require(:quest).permit(:title)
  end
end
