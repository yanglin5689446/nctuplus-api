class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # define /auth sign up API permited parameters
  def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :admission_year])
  end
end
