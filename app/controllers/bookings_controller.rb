class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @user = User.find(params[:user_id])
    @chalet = Chalet.find(params[:chalet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    user = User.find(params[:user_id])
    chalet = Chalet.find(params[:chalet_id])
    @booking.user = user
    @booking.chalet = chalet
    if @booking.save
      redirect_to chalet_path(chalet)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to chalets_path
  end

  private

  def booking_params
    params.require(:booking).permits(:check_in_date, :check_out_date)
  end
end
