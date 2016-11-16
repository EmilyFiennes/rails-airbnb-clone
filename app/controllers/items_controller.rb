class ItemsController < ApplicationController
  def index
    # @items = Item.all
    # Changed items for the maps - can be changed
    @items = Item.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@items) do |item, marker|
    marker.lat item.latitude
    marker.lng item.longitude
    # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
  end

  def new
  end

  def create
  end
end

