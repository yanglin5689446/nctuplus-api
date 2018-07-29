Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  scope 'api' do
    scope 'v1' do
      get "colleges", to: 'colleges#index', as: :colleges_path
      resources :users, only: [:index]
      resources :bulletins
      resources :books
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
