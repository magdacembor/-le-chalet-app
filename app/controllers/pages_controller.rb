class PagesController < ApplicationController

  def dashboard
    @chalets = Chalet.where(user: current_user)
    @bookings = Booking.where(user: current_user)
    @user = current_user
  end
end
