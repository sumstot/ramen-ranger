class BowlsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @bowls = Bowl.all
    end
  end

  def show
    @bowl = Bowl.find(params[:id])
  end

  def new
    @user = current.user
    @bowl = Bowl.new
  end

  def create
    @user = current.user
    @bowl = Bowl.new(bowl_params)
    @bowl.restaurant = @restaurant
    if @bowl.save
      redirect_to #somewhere rails paths
    else
      render :new, status: :unprocessable_entity
    end
  end

  def hall_of_fame
    @bowls = Bowl.all
    @top_rated = @bowls.find_all { |bowl| bowl.score == 5 }
  end

  def map
    @restaurants = Restaurant.all
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window: render_to_string(partial: "info_window", locals: {restaurant: restaurant})
      }
    end
  end

  private

  def bowl_params
    params.require(:bowl).permit(:soup, :score, :description, :review)
  end
end
