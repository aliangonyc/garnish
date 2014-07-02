class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]


  def index
    @foods = Food.all
  end

 
  def show
  end

  def new
    @food = current_user.foods.build
  end

  def edit
  end


  def create
    @food = current_user.foods.build(food_params)
      if @food.save
        redirect_to @food, notice: 'Food was successfully created.'
      else
        render action:'new'
       
    end
  end


  def update
      if @food.update(food_params)
        redirect_to @food, notice: 'Food was successfully updated.'
      else
        render action: 'edit'
      end
  end

  def destroy
    @food.destroy
      redirect_to foods_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.find(params[:id])
    end

    def correct_user
      @food = current_user.foods.find_by(id: params[:id])
      redirect_to foods_path, notice: "Not authorized to edit this food" if @food.nil?

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:item, :description)
    end
end
