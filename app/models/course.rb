class Course < ApplicationRecord
  #associations
  has_many :enrollments
  has_many :students, through: :enrollments


end
