class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :email, uniqueness: true
  validates :name, length: { maximum: 16, message: "姓名過長(max:16)" }, on: :update
  validates :admission_year, numericality: { greater_than: 0, message: "請填寫入學年度"}, on: :update

end
