class Profile < ApplicationRecord
  #associations
  belongs_to :user
  belongs_to :parent, class_name: 'User', optional: true 
  
  # active storage attachement
  has_one_attached :avatar
end
