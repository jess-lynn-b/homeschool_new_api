class Student < ApplicationRecord
  #associations
  belongs_to :parent
  has_many :enrollments
  has_many :students, through: :enrollments
  
  #validations
  validates :first_name, presence: true, length:{minimum: 3, maximum: 15}
  validates :last_name, presence: true, length: {minimum: 5, maximum: 20}
  validates :DOB, :gender, presence: true 
 
end
