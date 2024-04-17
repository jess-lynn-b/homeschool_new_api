require_relative 'image_blueprint' 

class AwardBlueprint < Blueprinter::Base
  identifier :id

  view :award do
    fields :title, :description, :award_image_url
    association :images, blueprint: ImageBlueprint 
  end
end