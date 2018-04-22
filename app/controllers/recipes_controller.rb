class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build (ingredient_type: "ingredient_0")
    @recipe.ingredients.build (ingredient_type: "ingredient_1")
  end

  def create
    recipe = Recipe.create(recipe_params)
    redirect_to recipe_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(
        :title,
        ingredients_attributes: [
          :recipe_ingredients_attributes_0_quantity,
          :recipe_ingredients_attributes_0_name,
          :recipe_ingredients_attributes_1_quantity,
          :recipe_ingredients_attributes_1_name
      ]
      )
    end
end
