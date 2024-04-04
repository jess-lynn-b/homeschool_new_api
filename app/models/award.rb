class Award < ApplicationRecord
  #associations
  belongs_to :user, :parent
  has_many_attached :images 

  # @award.images.attach(params[:images])
  # @award.images.attached?
end
