class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @user = current_user
    @chalet = Chalet.find(params[:chalet_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @chalet = Chalet.find(params[:chalet_id])
    @booking.user = current_user
    @booking.chalet_id = @chalet.id
    if @booking.valid?
      @booking.save
      redirect_to dashboard_path
    else
      render 'chalets/show', chalet: @chalet
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to dashboard_path(anchor: "your-bookings")
  end

  def approve
    @booking = Booking.find(params[:id])
    @booking.status = "Approved"
    @booking.save

    redirect_to dashboard_path(anchor: "property-booking")
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.status = "Declined"
    @booking.save

    redirect_to dashboard_path(anchor: "property-booking")
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date, :number_of_guests, :message)
  end
end
