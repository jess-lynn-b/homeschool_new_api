class User < ApplicationRecord
  has_secure_password
  #associations
  has_one :parent, dependent: :destroy
  has_one_attached :avatar

  #validations
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
