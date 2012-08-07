class UsersController < ApplicationController
	before_filter :authenticate_user!

	respond_to :html, :json

  def show
  end
  

  # Statuses
  # 	200 - OK
  # 	403 - password is incorect
  # 	500- Something went wrong, Server application error
  def update
  	respond_with(current_user) do |format|
  		format.json do
  			unless current_user.valid_password?(params[:user].delete(:password))
  				render json: {status: 403} and return
  			end
        # params[:user][:password] = params[:new_password] 
        if current_user.update_attributes params[:user]
          if params[:new_password]
            current_user.update_attributes(password: params[:new_password])
            sign_in(current_user, :bypass => true)
          end
  
  				render json: {status: 200, data: current_user}
  			else
  				render json: {status: 500, message: current_user.errors.full_messages.join(',')}
  			end
  		end
  		format.any {render :nothing}
  	end
  end


end
