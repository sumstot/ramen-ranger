class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show map]
  after_action :verify_authorized, except: %i[index show map]

  def index
    @restaurants =
    if params[:query].present?
      policy_scope(Restaurant).where("name ILIKE ?", "%#{params[:query]}%")
    else
      policy_scope(Restaurant)
    end
    @restaurants.each do |restaurant|
      restaurant.average_score = restaurant.bowls.average(:score).round(1) if restaurant.bowls.present?
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    authorize @restaurant
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def map
    @restaurants = policy_scope(Restaurant)
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window: render_to_string(partial: "info_window", locals: {restaurant: restaurant})
      }
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :jpn_name, :address, :average_score, :year_opened, :city, :prefecture, :station, :latitude, :longitude)
  end
end
