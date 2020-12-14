Rails.application.routes.draw do
  devise_for :users
  root to: 'quests#index'
  resources :quests, only: [:index, :new, :create, :destroy, :show] do
    resources :answers, only: [:new, :create, :edit, :update]
  end
end
