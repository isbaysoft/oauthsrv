class Oauth2ClientsController < ApplicationController

	before_filter :find_client, only: [:update, :edit, :destroy]

	respond_to :js, :json, :html

	def new
		@client = current_user.oauth2_clients.new
		respond_with(@client) do |format|
			format.js
		end		
	end

	def create
		@client = current_user.oauth2_clients.new params[:oauth2_client]
		@client.generate_secret
		respond_with(@client) do |format|
			format.js do
				unless @client.save
					render :new
				else
					Mailer.register_application(current_user,@client).deliver
					render :create
				end
			end
		end
	end

	def edit
		respond_with(@client) do |format|
			format.js
		end		
	end

	def update
		respond_with(@client) do |format|
			format.js do
				@client.identifier = params[:oauth2_client].delete(:identifier)
				@client.secret = params[:oauth2_client].delete(:secret)

				unless current_user.valid_password?(params[:password])
					@client.errors.add(:password, 'Password is incorrect')
  					render :edit and return
  				end

				if @client.update_attributes params[:oauth2_client]
					render :update
				else
					render :edit
				end
			end
		end
	end

	def destroy
		@client.destroy
	end

	def generate_secrets
		render json: {secret: Oauth2Client::generate_secrets('global_secret!!')}
	end

protected
	
	def find_client
		@client = current_user.oauth2_clients.find(params[:id])		
	end
end
