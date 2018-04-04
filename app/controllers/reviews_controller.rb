class ReviewsController < ApplicationController
  before_action :set_review, only: [:destroy, :show, :edit, :update]
  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
    @review.save
  end

  def edit
  end

  def create
    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
    @review = Review.new(review_params)
  end

  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Destroyed.' }
      format.json { head :no_content }
    end
    @review.destroy
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end
end
