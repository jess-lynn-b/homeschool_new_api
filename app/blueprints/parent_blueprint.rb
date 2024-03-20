class ParentBlueprint < Blueprinter::Base
  identifier :username

  view :noraml do
    fields :username, :first_name, :last_name, :password
  end
end