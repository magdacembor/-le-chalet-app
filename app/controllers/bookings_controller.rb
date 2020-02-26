class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @user = current_user
    @chalet = Chalet.find(params[:chalet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    chalet = Chalet.find(params[:chalet_id])
    @booking.user = current_user
    @booking.chalet_id = chalet.id
    if @booking.save
      redirect_to dashboard_path
    else
      redirect_to chalet_path(chalet)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to chalets_path
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, :number_of_guests)
  end
end
