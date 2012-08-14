class SessionsController < Devise::SessionsController

	alias_method :devise_new, :new

	def new
		redirect_to(root_path(anchor: 'signin'), Hash[flash])
	end

end
