Rails.application.routes.draw do
  root to: 'quests#index'
  resources :quests, only: [:index, :new, :create]
end
