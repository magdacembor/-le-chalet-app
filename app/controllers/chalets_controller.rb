class ChaletsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index ]
  before_action :find_chalet, only: [ :show, :edit, :update, :destroy ]

  def home; end

  def index
    @chalets = Chalet.geocoded
    if defined?(params[:index][:address]) && !params[:index][:address].empty?
      @address = params[:index][:address]
      @chalets = Chalet.near(@address, 15)
      if defined?(params[:index][:number_of_guests]) && params[:index][:number_of_guests].to_i > 0
        @chalets = @chalets.where("number_of_guests >= :query", query: params[:index][:number_of_guests].to_i)
      end
    end
    @markers = @chalets.map do |chalet|
      {
        lat: chalet.latitude,
        lng: chalet.longitude
      }
    end
  end

  def show
    @booking = Booking.new
    @booking.user_id = current_user
    @review = Review.new
    @review.user_id = current_user
    @markers = [
      { lng: @chalet.longitude, lat: @chalet.latitude }
    ]
  end

  def new
    @chalet = Chalet.new
  end

  def create
    @chalet = Chalet.new(chalet_params)
    @chalet.user = current_user
    if @chalet.save
      redirect_to chalet_path(@chalet)
    else
      render :new
    end
  end

  def edit; end

  def update
    @chalet.update(chalet_params)
    if @chalet.save
      redirect_to chalet_path(@chalet)
    else
      render :edit
    end
  end

  def destroy
    @chalet.destroy
    redirect_to :index
  end

  private

  def find_chalet
    @chalet = Chalet.find(params[:id])
  end

  def chalet_params
    params.require(:chalet).permit(:name, :description, :country, :address, :number_of_guests, :number_of_bedrooms, :price, photos: [])
  end
end
