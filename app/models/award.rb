class Award < ApplicationRecord
  #associations
  belongs_to :user
  # belongs_to :parent
  has_many_attached :images 
  
  # Add the following attributes
  attribute :title, :string
  attribute :description, :text

  # Add validations if needed
  validates :title, presence: true
 
end
