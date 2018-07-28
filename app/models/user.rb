class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # TODO: configure omniauth for devise_token_auth
  # https://devise-token-auth.gitbook.io/devise-token-auth/configuration/omniauth
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one :user
  has_many :users_events
  has_many :events, through: :users_events

  validates :email, uniqueness: true
  validates :name, length: { maximum: 16, message: "姓名過長(max:16)" }
  validates :admission_year, numericality: { greater_than: 0, message: "請填寫入學年度" }
end
