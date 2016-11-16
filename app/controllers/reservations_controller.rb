class ReservationsController < ApplicationController
  before_action :set_item, only: [:new, :create, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new
    @reservation.item = @item
    if @reservation.save
      redirect_to user_path
    else
      redirect_to item_path
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end
end
