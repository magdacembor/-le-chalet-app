class ReviewsController < ApplicationController
  before_action :find_chalet, only: [:new, :create]

  def new
    @user = current_user
    @review = Review.new
  end

  def create
    @user = current_user
    @review = Review.new(review_params)
    @review.chalet = @chalet
    @review.user = current_user
    if @review.save
      redirect_to chalet_path(@chalet)
    else
      render "chalets/show"
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

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
