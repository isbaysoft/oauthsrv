class User < ActiveRecord::Base
  has_many :oauth2_clients

  devise :database_authenticatable, 
  	:registerable,
		:recoverable, :rememberable, :trackable, :validatable
		
  devise :oauth2_providable, 
		:oauth2_password_grantable,
		:oauth2_refresh_token_grantable,
		:oauth2_authorization_code_grantable

  after_create :send_welcome_email 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :last_name, :first_name, :alternate_name, :email, :password, :password_confirmation, :remember_me
  
  validates :first_name, :last_name, :alternate_name, :length => {:maximum => 50}

  def as_json(options)
    {new_password: new_password}.merge(self.attributes)
  end

  def new_password
    '*********'
  end

  def full_user_name
    uname = [first_name,last_name].compact.join(' ')
    uname.blank? ? email : uname
  end

protected
  
  def send_welcome_email 
    Mailer.welcome_email(self).deliver
  end


end
