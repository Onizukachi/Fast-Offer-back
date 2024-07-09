Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'api/v1/users/sessions',
               registrations: 'api/v1/users/registrations'
             }

  namespace :api do
    namespace :v1 do
      resources :questions do
        member do
          post 'like', to: 'questions#like'
          delete 'unlike', to: 'questions#unlike'
        end
      end
      resources :positions, except: %i[show]
    end
  end
end
