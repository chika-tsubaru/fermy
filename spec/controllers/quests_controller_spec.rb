require 'rails_helper'

describe QuestsController do
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET index' do
    it "populates an array of quests ordered by createed_at DESC" do
      quests = create_list(:quest, 3)
      get :index
      expect(assigns(:quests)).to match(quests.sort{ |a,b| b.created_at <=> a.created_at} )
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end
end