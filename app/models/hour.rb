class Hour< ApplicationRecord

  #Associations
  belongs_to :user
  has_many_attached :images
end
