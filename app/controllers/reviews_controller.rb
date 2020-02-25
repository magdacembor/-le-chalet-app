class ReviewsController < ApplicationController
  before_action :find_chalet, only: [:new, :create]
  before_action :find_user, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.chalet = @chalet
    @review.user = @user
    if @review.save
      redirect_to chalet_path(@chalet)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to chalet_path(@review.chalet)
  end


  private

  def find_chalet
    @chalet = Chalet.find(params[:chalet_id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
