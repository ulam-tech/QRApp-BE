Rails.application.routes.draw do
  resources :qr_codes
  resources :users

  get '/users_qr_codes/:id', to: 'users#users_qr_codes'

  devise_for :users,
             path: '',
             path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 registration: 'signup'
             },
             controllers: {
                 sessions: 'sessions',
                 registrations: 'registrations'
             }

  root to: "application#status"
end
