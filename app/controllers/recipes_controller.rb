class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.all
    # @foods = @recipe.recipe_foods.includes(:food).all
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    if @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe successfully deleted'
    else
      render :new
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe added successfully'
    else
      render :new, alert: 'Recipe not successfully added'
    end
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def total_cost(recipe)
    recipe.foods.map do |ingredient|
      ingredient.price.to_i
    end
  end

  def total_quantity(recipe)
    recipe.recipe_foods.map(&:quantity)
  end

  def total_recipy_food(arrays)
    total = 0
    arrays.each do |array|
      total += array[0] * array[1]
    end
    total
  end
  helper_method :total_cost, :total_quantity, :total_recipy_food
end
