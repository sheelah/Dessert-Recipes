class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :get_user_name

 	private
  def authorize
    unless session[:user_id] && User.find(session[:user_id])
      redirect_to '/login'
    end
  end

  private
  def get_user_name(user_id)
    user_name = User.find_by_id(user_id).name
  end

  private
  # Only recipe author can edit/delete a recipe
  def allow_recipe_changes
    unless session[:user_id] == Recipe.find(params[:id]).user_id
      redirect_to root_url,
      :notice => "Sorry.. Only the recipe author can manage his/her recipes."
    end
  end

  private
  # Only rating author can edit/delete ratings
  def allow_rating_changes
    unless session[:user_id] == Rating.find(params[:id]).user_id
      redirect_to root_url,
      :notice => "Sorry.. Only the rating author can manage his/her ratings."
    end
  end
end