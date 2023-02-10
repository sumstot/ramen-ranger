class BowlsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show hall_of_fame]
  after_action :verify_authorized, except: %i[index show hall_of_fame]
  def index
    @bowls =
    if params[:query].present?
      policy_scope(Bowl).where("soup ILIKE ?", "%#{params[:query]}%")
    else
      policy_scope(Bowl)
    end
  end

  def show
    @bowl = Bowl.find(params[:id])
  end

  def new
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @bowl = Bowl.new
  end

  def create
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @bowl = Bowl.new(bowl_params)
    @bowl.restaurant = @restaurant
    if @bowl.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def hall_of_fame
    @bowls = Bowl.all
    @top_rated = @bowls.find_all { |bowl| bowl.score == 5 }
  end

  private

  def bowl_params
    params.require(:bowl).permit(:soup, :score, :description, :review, :price, :images [])
  end

end
