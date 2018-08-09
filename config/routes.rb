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
      resources :events

      resources :permanent_courses, only: [:index, :show]
      resources :courses, only: [:index, :show, :update]
      post 'courses/:id/rating', to: 'courses#rating', as: :course_rating

      resources :users, only: [:index]
      scope 'users/(:id)' do
        resources :timetables
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
