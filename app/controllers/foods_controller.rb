class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]


  def index
    @foods = Food.all
  end

 
  def show
  end

  def new
    @food = Food.new
  end

  def edit
  end


  def create
    @food = Food.new(food_params)
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:item, :description)
    end
end
