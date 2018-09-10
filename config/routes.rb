Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  scope 'api' do
    scope 'v1' do
      get 'colleges', to: 'colleges#index', as: :colleges
      get 'departments', to: 'departments#index', as: :departments
      get 'teachers', to: 'teachers#index', as: :teachers
      get 'semesters', to: 'semesters#index', as: :semesters

      resources :bulletins
      resources :books
      resources :past_exams
      resources :events do
        post 'action', to: 'events#action', as: :action
        delete 'action', to: 'events#revoke_action', as: :revoke_action
      end

      resources :permanent_courses, only: [:index, :show]
      resources :courses, only: [:index, :show, :update]
      post 'courses/:course_id/rating', to: 'courses#rating', as: :course_rating

      resources :users, only: [:index]
      namespace 'my' do
        get '/books', to: 'info#books', as: :my_books
        get '/events', to: 'info#events', as: :my_events
        get '/courses', to: 'info#courses', as: :my_courses
        get '/past_exams', to: 'info#past_exams', as: :my_past_exams
        get '/graduation_progress', to: 'info#graduation_progress', as: :my_graduation_progress
        resources :timetables
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
