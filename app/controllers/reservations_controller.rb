class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.all
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @game = Game.find(params[:game_id])
    @reservation = Reservation.new
  end

  def create
    @reservation= Reservation.new(reservation_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @game = Game.find(params[:game_id])
    @reservation.game = @game
    @reservation.save
    redirect_to game_path(@game)
  end

  def edit
    @game = Game.find(params[:game_id])
    @reservation = Reservation.new
  end

  def update
    @reservation= Reservation.new(reservation_params)
    # we need `restaurant_id` to associate review with corresponding restaurant
    @game = Game.find(params[:game_id])
    @reservation.game = @game
    @reservation.save
    redirect_to game_path(@game)
  end
end