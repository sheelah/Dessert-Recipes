class AllRecipesController < ApplicationController
  def index
  	@recipes = Recipe.order(:name)  # list all recipes ordered by name
  end
end
