require 'sidekiq/web'
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  mount Sidekiq::Web => "/sidekiq"

  get 'commits_chart', to: 'user#commits_chart', as: "commits_chart"
  get 'additions_chart', to: 'user#additions_chart', as: "additions_chart"

  resources :home, only: [:index]
  resources :user, only: [:index]
  resources :repositories, only: [:index, :show]

  resources :projects

  get '/user/logout', to: 'sessions#logout', as: 'logout'

  post '/projects/:id/accepted', to: 'projects#accept', as: 'accept_project'
  post '/projects/:id/under_review', to: 'projects#review', as: 'review_project'

  delete "remove_pm", to: 'project_managers#remove_pm', as: "remove_pm"
  delete "remove_apm", to: 'project_managers#remove_apm', as: "remove_apm"
  post "update_pm", to: 'project_managers#update_pm', as: "update_pm"
  post "update_apm", to: 'project_managers#update_apm', as: "update_apm"
  get '/auth/github', as: :github_login
  get '/auth/github/callback', to: 'sessions#create'
end
