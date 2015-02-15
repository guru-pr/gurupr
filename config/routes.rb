Rails.application.routes.draw do
  get    '/join',                    to: redirect('/auth/github')
  delete '/logout',                  to: 'sessions#destroy'
  get    '/auth/:provider/callback', to: 'sessions#create'
  get    '/auth/failure',            to: 'sessions#failure'

  resources :events, only: :show

  namespace :admin do
    resources :users, only: [:index] do
      resource :accesses, only: [:create, :destroy]
    end

    resources :events, only: [:index, :new, :create, :edit, :update]
  end

  root 'welcome#index'
end
