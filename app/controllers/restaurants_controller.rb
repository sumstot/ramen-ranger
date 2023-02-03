class RestaurantsController < ApplicationController
  def index
    if params[:query].present?
      @restaurants = Restaurant.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :jpn_name, :address, :average_score, :year_opened, :city, :prefecture, :station, :latitude, :longitude)
  end
end
