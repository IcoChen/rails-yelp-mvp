class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:destroy, :show, :edit, :update]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.save
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Created.' }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Updated.' }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: 'Destroyed.' }
      format.json { head :no_content }
    end
  end


  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :description, :stars)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
