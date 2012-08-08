class Oauth2Client < ActiveRecord::Base
	belongs_to :user
	
	attr_accessible :name, :redirect_uri, :website, :support_email, :contact_email, :app_description

	validates :name, :redirect_uri, :website, :identifier, :secret, :user_id, :presence => true
	validates :name, :redirect_uri, :website, :identifier, :secret, :uniqueness => true

	def generate_secret
		self.identifier = Oauth2Client::generate_secrets('!self.identifier')
		self.secret = Oauth2Client::generate_secrets('!self.secret')
	end

	class << self
		def generate_secrets(hash)
			Digest::MD5.hexdigest(Time.now.strftime("%Y%m%d%j%p%H%S%M%L%12N") << hash)
		end
	end

end
