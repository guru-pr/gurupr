Rails.application.routes.draw do
  get    '/join',                    to: redirect('/auth/github')
  delete '/logout',                  to: 'sessions#destroy'
  get    '/auth/:provider/callback', to: 'sessions#create'
  get    '/auth/failure',            to: 'sessions#failure'

  localized do
    resources :events,       only: [:index, :show]
    resources :certificates, only: :show
    get '/profile',          to: 'profile#show'
    patch '/profile',        to: 'profile#update'
    get '/profile/edit',     to: 'profile#edit'
  end

  namespace :admin do
    resources :users, only: :index do
      resource :accesses, only: [:create, :destroy]
    end

    resources :events, except: :show
  end

  root 'welcome#index'
end
