class User < ApplicationRecord
  has_secure_password
  has_one_attached :image
  #associations
  has_one :parent, dependent: :destroy

  #validations
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
