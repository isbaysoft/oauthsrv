class Mailer < ActionMailer::Base

	default from: Setting.email_from

	def welcome_email(user)
		@user = user
		mail to: user.email, subject: 'Welcom to RRauth'
	end

	def register_application(user,application)
		@user,@application = user,application
		mail to: user.email, subject: 'Registered new application'
	end

end
