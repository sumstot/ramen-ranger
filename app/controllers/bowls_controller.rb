class BowlsController < ApplicationController
  before_action :set_restaurant, only: %i[new create]
  before_action :set_bowl, only: %i(new create)
  skip_before_action :authenticate_user!, only: %i[index show hall_of_fame]
  after_action :verify_authorized, except: %i[index show hall_of_fame]
  def index
    @bowls =
    if params[:query].present?
      policy_scope(Bowl).where("name ILIKE ?", "%#{params[:query]}%")
    else

      policy_scope(Bowl).includes(images_attachments: :blob).all
    end
  end

  def show
  end

  def new
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @bowl = Bowl.new
    authorize @bowl
  end

  def create
    @bowl = @restaurant.bowls.build(bowl_params)
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

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  def set_bowl
    @bowl = Bowl.find(params[:id])
  end
end
