class User < ActiveRecord::Base
	include ActiveModel::ForbiddenAttributesProtection
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :account_type
  has_many :authentications, :dependent => :destroy

  validates_presence_of :first_name, :last_name, :account_type_id



  def apply_omniauth(auth)
		# In previous omniauth, 'user_info' was used in place of 'raw_info'
		self.email = auth['extra']['raw_info']['email']
		# Again, saving token is optional. If you haven't created the column in authentications table, this will fail
		# save user info from facebook details.
    authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
	end
	
end
