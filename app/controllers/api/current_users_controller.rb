class Api::CurrentUsersController < ApplicationController
	before_filter :authenticate_user!

	def show
		render json: current_user
	end
end
