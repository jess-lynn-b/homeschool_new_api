class Parent < ApplicationRecord
  #associations
  belongs_to :user

  #validations
  validates :first_name, presence: true, length:{minimum: 3, maximum: 15}

  validates :last_name, presence: true, length: {minimum: 5, maximum: 20}
end
