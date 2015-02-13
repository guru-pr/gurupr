Rails.application.routes.draw do
  get    '/join',                    to: redirect('/auth/github')
  delete '/logout',                  to: 'sessions#destroy'
  get    '/auth/:provider/callback', to: 'sessions#create'
  get    '/auth/failure',            to: 'sessions#failure'

  resources :events, only: :show

  root 'welcome#index'
end
