Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  resources :home, only: [:index]
  resources :user, only: [:show]
  resources :repositories, only: [:index, :show]

  post "update_pm", to: 'project_managers#update_pm'
  post "update_apm", to: 'project_managers#update_apm'
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
end
