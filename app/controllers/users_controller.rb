class UsersController < ApplicationController
  def new
		@user = User.new
	end

	def index
		@users = User.all
	end

	def create
		@user = User.new(params[:user])
		if @user.save  # User was saved successfully
			redirect_to users_url
		else  # Save failed
			render "new"  # Show the new user form again
		end
	end

end
