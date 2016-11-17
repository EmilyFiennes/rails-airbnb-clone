class ReservationsController < ApplicationController
  before_action :set_item, only: [:new, :create, :edit, :update, :destroy, :cancel, :accept, :decline]

  def index
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def create
    user = current_user
    @reservation = user.reservations.new(reservation_params)
    @reservation.item = @item
    if @reservation.save
      flash[:notice] = "Reservation successfully created. See details on your dashboard."
      redirect_to @reservation.user
    else
      flash[:alert] = "Please review reservation form for errors."
      render 'items/show'
    end
  end

  def destroy
    user = current_user
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to @reservation.user
  end

  def cancel
    @reservation = Reservation.find(params[:id])
    @reservation.cancelled_on = DateTime.now
       @reservation.save
    redirect_to @reservation.item.user
  end

  def accept
    @reservation = Reservation.find(params[:id])
    @reservation.validated_on = DateTime.now
    @reservation.save
    redirect_to @reservation.item.user
  end

  def decline
    @reservation = Reservation.find(params[:id])
    @reservation.declined_on = DateTime.now
    @reservation.save
    redirect_to @reservation.item.user
  end

  def edit
  end

  def update
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def reservation_params
    params.require(:reservation).permit(:start_on, :end_on, :user_id, :item_id, :validated_on)
  end
end
