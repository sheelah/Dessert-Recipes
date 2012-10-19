class RatingsController < ApplicationController
	before_filter :get_recipe
	before_filter :authorize, :except => [:index, :show]
	before_filter :allow_rating_changes, :only => [:edit, :update, :destroy]
	# :get_recipe is defined at the bottom of the file, and takes the
	# recipe_id given by routing and converts it to a @recipe object.

	def index
		@ratings = @recipe.ratings

		respond_to do | format |
			format.html # index.html.erb
			format.json { render json: @ratings }
		end
	end

	# GET /ratings/1
	# GET /ratings/1.json
	def show
		@rating = @recipe.ratings.find(params[:id])

		respond_to do | format |
			format.html # show.html.erb
			format.json { render json: @rating }
		end
	end

	# GET /ratings/new
	# GET /ratings/new.json
	def new
		@recipe = Recipe.find(params[:recipe_id])
		@rating = @recipe.ratings.build

		respond_to do | format |
			format.html # new.html.erb
			format.json { render json: @rating }
		end
	end

	# GET /ratings/1/edit
	def edit
		@rating = @recipe.ratings.find(params[:id])
	end

	# POST /ratings
	# POST /ratings.json
	def create
		@rating = @recipe.ratings.build(params[:rating])

		respond_to do | format |
			if @rating.save
				format.html { redirect_to recipe_ratings_url(@recipe),
					notice: 'Rating was successfully created.'}
				format.json { render json: @rating, status: :created,
				  location: @rating }
			else
			  format.html { render action: "new" }
			  format.json { render json: @rating.errors, status: :unprocessible_entity }
			end
	  end
	end

  # PUT /ratings/1
  # PUT /ratings/1.json
  def update
  	@rating = @recipe.ratings.find(params[:id])

  	respond_to do | format |
  		if @rating.update_attributes(params[:rating])
  			format.html { redirect_to recipe_ratings_url(@recipe), notice: 'Rating was successfully updated.'}
  			format.json { head :ok }
  		else
  			format.html { render action: "edit" }
  			format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
  	@rating = @recipe.ratings.find(params[:id])
  	@rating.destroy

  	respond_to do | format |
  		format.html { redirect_to (recipe_ratings_path(@recipe)) }
  		format.json {head :ok }
    end
  end

  private
  # get_recipe converts the recipe_id given by routing into a @recipe object, for use here and in the view.
  def get_recipe
  	@recipe = Recipe.find(params[:recipe_id])
  end

end
