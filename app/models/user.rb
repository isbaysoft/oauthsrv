class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
  	:registerable,
		:recoverable, :rememberable, :trackable, :validatable
		
  devise :oauth2_providable, 
		:oauth2_password_grantable,
		:oauth2_refresh_token_grantable,
		:oauth2_authorization_code_grantable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  validates :first_name, :last_name, :alternate_name, :length => {:maximum => 50}

end