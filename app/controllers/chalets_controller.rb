class ChaletsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :index ]
  before_action :find_chalet, only: [ :show, :edit, :update, :destroy ]

  def home; end

  def index
    @chalets = Chalet.all
    @address = params[:index][:address]
  end

  def show
    @booking = Booking.new
    @booking.user_id = current_user
    @review = Review.new
    @review.user_id = current_user
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
