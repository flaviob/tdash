Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # OmniAuth routes for Google OAuth2
  get '/users/auth/:provider/callback', to: 'sessions#google_auth'
  get '/users/auth/failure', to: redirect('/')

  # Route to initiate Google OAuth login
  get '/users/auth/google', to: redirect('/users/auth/google_oauth2')

  # Root path
  root 'dashboard#index'

  # Search console routes
  get 'search_console', to: 'search_console#index'
  post 'search_console/analytics', to: 'search_console#search_analytics'
end
