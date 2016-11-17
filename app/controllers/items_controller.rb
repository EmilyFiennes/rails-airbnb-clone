class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

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
    @reservation = Reservation.new
    @hash = Item.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@item) do |item, marker|
    marker.lat item.latitude
    marker.lng item.longitude
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      flash[:notice] = "Your item  #{@item.title} has been created"
      redirect_to @item
    else
      render :new
    end
  end

  def destroy
    user = current_user
    if @item.destroy
      flash[:alert] = "Your advert: #{@item.title}, has been successfully deleted. See below."
    end
    redirect_to user_path(user)
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:user, :title, :brand_name, :model, :model_year, :material_category, :length, :segment, :skill_level, :price, :ski_station, :user_id, :picture_url)
  end
end

