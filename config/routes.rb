Rails.application.routes.draw do
  devise_for :users
  root to: 'quests#index'
  resources :quests, only: [:index, :new, :create, :show] do
    resources :answers, only: [:new, :create]
  end
end
