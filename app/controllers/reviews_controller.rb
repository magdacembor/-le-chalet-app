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
    if @review.valid?
      @review.save
      redirect_to chalet_path(@chalet, anchor: "review")
    else
      render 'chalets/show', chalet: @chalet
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to chalet_path(@review.chalet, anchor: "review")
  end


  private

  def find_chalet
    @chalet = Chalet.find(params[:chalet_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
