class FoodsController < ApplicationController
  # before_action :set_food, only: i%[edit update destroy]

  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def shopping_list
    @foods = Food.includes(:recipe_foods).where(recipe_foods: { food_id: nill })
    @sum = sumtotal(@foods)
    @qty = quantity_total(@foods)
  end

  def edit
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to root_path, notice: 'Food added successfully'
    else
      render :new, alert: 'Food not successfully added'
    end
  end

  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_url(@food), notice: 'Food successfuly updated.' }
      else
        format.html { render :edit, status: :unprecessable_entity }
      end
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    if @food.destroy
      redirect_to root_path, notice: 'Recipe successfully deleted'
    else
      render :new
    end
  end

  private

  def set_food
    @food = Food.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end

  def sumtotal(obj)
    sum = 0
    obj.each do |value|
      sum += value.price
    end
    sum
  end

  def quantity_total(obj)
    sum = 0
    obj.each do |value|
      sum += value.quantity.to_i
    end
    sum
  end
end
