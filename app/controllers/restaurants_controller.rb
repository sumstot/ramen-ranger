class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save?
      redirect_to restaurant_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :jpn_name, :address, :average_score, :year_opened, :city, :prefecture, :station, :latitude, :longitude)
  end
end
