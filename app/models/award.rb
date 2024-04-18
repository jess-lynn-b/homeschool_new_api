class Award < ApplicationRecord
  include Rails.application.routes.url_helpers

  #associations
  belongs_to :user
  has_many_attached :images 
  
  # Add the following attributes
  attribute :title, :string
  attribute :description, :text

  # Add validations if needed
  validates :title, presence: true
 
  def award_image_url
    if images.attached?
      rails_blob_url(images.first)
    else
      ActionController::Base.helpers.asset_path('default_image.jpg')
    end
  end

  def resize_image(input_file, output_file, width, height)
    image = MiniMagick::Image.open(input_file)
    image.resize "#{width}x#{height}"
    image.write output_file
  end
end