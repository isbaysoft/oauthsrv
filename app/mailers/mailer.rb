class Mailer < ActionMailer::Base

	default from: Setting.email_from

	def welcome_email(user)
		@user = user
		mail to: user.email, subject: 'Welcom to RRauth'
	end

end
