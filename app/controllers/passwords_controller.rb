class PasswordsController < Devise::PasswordsController

	def create
		unless verify_recaptcha
			flash[:error] = "Verification is not passed"
			redirect_to root_path anchor: 'passwordReset'
		else
			self.resource = resource_class.send_reset_password_instructions(resource_params)   
			respond_with({}, :location => after_sending_reset_password_instructions_path_for(resource_name))    
		end
	end
	
end
