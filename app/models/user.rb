class User < ActiveRecord::Base
  has_many :locations
  has_many :restaurants, through: :locations
  has_many :items, through: :restaurants

  has_secure_password

  validates :username, presence: true
  validates :username, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
     user.email = auth.info.email
     user.uid = auth.uid
     user.provider = auth.provider
     user.avatar_url = auth.info.image
     user.username = auth.info.name
     user.oauth_token = auth.credentials.token
     user.password = SecureRandom.hex
     user.save!
   end
 end

 # def self.from_omni(auth)
 #  # Creates a new user only if it doesn't exist
 #  where(email: auth.info.email).first_or_initialize do |user|
 #    user.name = auth.info.name
 #    user.email = auth.info.email
 #  end
 # end
end
