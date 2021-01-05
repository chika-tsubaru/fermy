require 'rails_helper'

describe QuestsController do
  let(:user) { create(:user) }

  describe 'GET #new' do
    context 'log in' do
      before do
        login user
        get :new
      end

      it "assigns @quest" do
        expect(assigns(:quest)).to be_a_new(Quest)
      end

      it "renders the :new template" do
        expect(response).to render_template :new
      end
    end

    context 'not log in' do
      before do
        get :new
      end

      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    let(:params) { { user_id: user.id, quest: attributes_for(:quest) } }

    context 'log in' do
      before do
        login user
      end

      context 'can save' do
        subject {
          post :create,
          params: params
        }

        it 'count up quest' do
          expect{ subject }.to change(Quest, :count).by(1)
        end

        it 'redirects to root_path' do
          subject
          expect(response).to redirect_to(root_path)
        end
      end

      context 'can not save' do
        let(:invalid_params) { { user_id: user.id, quest: attributes_for(:quest, title: nil) } }

        subject {
          post :create,
          params: invalid_params
        }

        it 'does not count up' do
          expect{ subject }.not_to change(Quest, :count)
        end

        it 'renders new_quest_path' do
          subject
          expect(response).to redirect_to(new_quest_path)
        end
      end
    end

    context 'not log in' do

      it 'redirects to new_user_session_path' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #index' do
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

  describe 'GET #show' do

    it "select quest successfully" do
      quest = create(:quest)
      get :show, params: { id: quest.id }
      expect(assigns(:quest)).to eq(quest)
    end

    it "renders the :show template" do
      quest = create(:quest)
      get :show, params: { id: quest.id }
      expect(response).to render_template :show
    end
  end

  describe 'DELETE #destroy' do
    let(:params) { { user_id: user.id, quest: attributes_for(:quest) } }

    context 'log in' do
      before do
        login user
      end

      it 'count down quest' do
        quest = create(:quest)
        expect{ delete :destroy, params: { id: quest.id } }.to change(Quest, :count).by(-1)
      end

      it 'redirects to root_path' do
        quest = create(:quest)
        expect( delete :destroy, params: { id: quest.id } ).to redirect_to(root_path)
      end
    end

    context 'not log in' do

      it 'redirects to new_user_session_path' do
        quest = create(:quest)
        expect( delete :destroy, params: { id: quest.id } ).to redirect_to(new_user_session_path)
      end
    end
  end
end