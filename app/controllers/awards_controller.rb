class AwardsController < ApplicationController
  before_action :authenticate_request, only: [:upload_image]

  def create
    @award = Award.new(award_params)
    
    if @award.save
      redirect_to @award, notice: "Award successfully created."
    else
      @award = params[:award][:image] if params[:award][:image].present?
      render :new
    end
  end

  

  private
    def award_params
      params.require(:award).permit(images: [])
    end
end

<%= form_with(model: award, local: true) do |f| %>
  <% if @image %>
    <%= f.hidden_field :image, id: nil, value: params[:award] %>
  <% else %>
    <%= f.file_field :image, direct_upload: true %>
  <%= f.submit %>
  <% end %>
  <%= f.submit %>
<% end %>
