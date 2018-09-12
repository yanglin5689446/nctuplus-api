Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', defaults: { format: :json }
  scope 'api' do
    scope 'v1' do
      resources :colleges, only: [:index]
      resources :departments, only: [:index]
      resources :teachers, only: [:index]
      resources :semesters, only: [:index]
      resources :bulletins
      resources :books
      resources :past_exams
      resources :events do
        post 'follow', to: 'events#follow', as: :follow
        delete 'follow', to: 'events#unfollow', as: :unfollow
      end
      resources :permanent_courses, only: [:index, :show]
      resources :courses, only: [:index, :show, :update] do
        post 'rating', to: 'courses#rating', as: :rating
        post 'favorite', to: 'courses#favorite', as: :favorite
        delete 'favorite', to: 'courses#remove_favorite', as: :remove_favorite
      end
      resources :users, only: [:index]

      # 跟已登入 user 相關路由
      # 所有此 namespace 下的路由都要過 auth
      namespace 'my' do
        get '/books', to: 'info#books', as: :books
        get '/events', to: 'info#events', as: :events
        get '/courses', to: 'info#courses', as: :courses
        get '/past_exams', to: 'info#past_exams', as: :past_exams
        get '/graduation_progress', to: 'info#graduation_progress', as: :graduation_progress
        resources :timetables
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
