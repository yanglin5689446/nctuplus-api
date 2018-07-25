Rails.application.routes.draw do
  resources :books
  mount_devise_token_auth_for 'User', at: 'auth'
  scope 'api' do
    scope 'v1' do
      resources :users, only: [:index]
      resources :bulletins
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
