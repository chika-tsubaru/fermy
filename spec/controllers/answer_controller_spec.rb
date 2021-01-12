require 'rails_helper'

describe AnswersController do
  let(:user) { create(:user) }
  let(:quest) { create(:quest)}

  describe 'GET #new' do
    context 'log in' do
      before do
        login user
        get :new, params: {quest_id: quest.id}
      end

      it "assigns @answer" do
        expect(assigns(:answer)).to be_a_new(Answer)
      end

      it "assigns @quest" do
        expect(assigns(:quest)).to eq quest
      end

      it "renders the :new template" do
        expect(response).to render_template :new
      end
    end

    context 'not log in' do
      before do
        get :new, params: {quest_id: quest.id}
      end

      it 'redirects to new_user_registration_path' do
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end

  describe 'POST #create' do
    let(:params) { { user_id: user.id, quest_id: quest.id, answer: attributes_for(:answer) } }

    context 'log in' do
      before do
        login user
      end

      context 'can save' do
        subject {
          post :create,
          params: params
        }

        it 'count up answer' do
          expect{ subject }.to change(Answer, :count).by(1)
        end

        it 'redirects to quest_path' do
          subject
          expect(response).to redirect_to(quest_path(quest))
        end
      end

      context 'can not save' do
        let(:invalid_params) { { user_id: user.id, quest_id: quest.id, answer: attributes_for(:answer, plan: nil) } }

        subject {
          post :create,
          params: invalid_params
        }

        it 'does not count up' do
          expect{ subject }.not_to change(Answer, :count)
        end

        it 'renders new_quest_answer_path' do
          subject
          expect(response).to redirect_to(new_quest_answer_path)
        end
      end
    end

    context 'not log in' do

      it 'redirects to new_user_registration_path' do
        post :create, params: params
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end

  describe 'GET #edit' do
    let(:params) { { user_id: user.id, quest_id: quest.id, answer: attributes_for(:answer) } }
    let(:update_params) { { user_id: user.id, quest_id: quest.id, answer: attributes_for(:answer, plan: "update") } }


    context 'log in' do
      
      before do
        login user
      end

      subject {
        post :create,
        params: params
      }

      it "assigns @quest" do
        subject
        get :edit, params: update_params
        expect(assigns(:quest)).to eq quest
      end

      it "assigns @answer" do
        subject
        get :edit, params: update_params
        expect(assigns(:answer)).to eq answer
      end

      it "renders the :edit template" do
        expect(response).to render_template :edit
      end
    end

    context 'not log in' do
      before do
        get :edit, params: { user_id: user.id, quest_id: quest.id, answer: attributes_for(:answer) }
      end

      it 'redirects to new_user_registration_path' do
        expect(response).to redirect_to(new_user_registration_path)
      end
    end
  end
  
end