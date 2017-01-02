Rails.application.routes.draw do
  get    '/join',                    to: redirect('/auth/github')
  delete '/logout',                  to: 'sessions#destroy'
  get    '/auth/:provider/callback', to: 'sessions#create'
  get    '/auth/failure',            to: 'sessions#failure'

  localized do
    resources :events,       only: [:index, :show]
    resources :certificates, only: :show
    get '/profile',          to: 'profile#show'
    get '/profile/update',   to: 'profile#update'
  end

  namespace :admin do
    resources :users, only: :index do
      resource :accesses, only: [:create, :destroy]
    end

    resources :events, except: :show
  end

  root 'welcome#index'
end
