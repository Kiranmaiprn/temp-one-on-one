class Employee < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  validates :name,:role,presence: true

  has_many :one_on_ones, dependent: :destroy
  has_many :device_tokens, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
      super
  end
  def on_jwt_dispatch(token, payload)
    @auth_token = token
  end
  def auth_token
    @auth_token
  end

  ROLES = %w{ur_hr ur_software_engineer ur_lead ur_manager}
  validates :role, inclusion: {in: ROLES, message: "%{value} is not valid"}

  after_save :employee_name
  
  def employee_name
    self.name = self.name.capitalize
  end

end


