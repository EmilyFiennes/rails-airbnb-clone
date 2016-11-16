class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
    # @items = Item.all
    # Changed items for the maps - can be changed
    @items = Item.where.not(latitude: nil, longitude: nil).take(6)
    @hash = Gmaps4rails.build_markers(@items) do |item, marker|
    marker.lat item.latitude
    marker.lng item.longitude
    # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @reservations = Reservation.all
    @reservation = Reservation.new
    @reviews = @reservations.where(item_id: @item.id)
    @hash = Item.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@item) do |item, marker|
    marker.lat item.latitude
    marker.lng item.longitude
    end
  end

  def new
  end

  def create
  end

  def set_item
    @item = Item.find(params[:id])
  end
end

