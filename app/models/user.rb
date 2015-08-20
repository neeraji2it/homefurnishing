class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:facebook]
     

   has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/missing-user.png"
   validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/  
  
  has_many :orders
  serialize :details
  #validates :first_name, :last_name,  :presence => true
  #validates :mobile_number,:allow_blank => true,
#:numericality => true,
    #             :length => { :minimum => 10 ,:maximum => 10 }

    #   def self.create_with_omniauth(auth)
    # create! do |user|
    #   user.provider = auth["provider"]
    #   user.uid = auth["uid"]
    #   user.name = auth["user_info"]["name"]
    # end
    # end

def self.from_omniauth(auth_hash)
  unless user = User.find_by_email(auth_hash['info']['email'])
      email = auth_hash['info']['email']
      provider = auth_hash['provider']
      uid = auth_hash['uid']
      secret = auth_hash['secret']
      details = auth_hash
      token = auth_hash['credentials'].try(:"[]", "token")
      user = User.new :email => email, :confirmation_token => nil, :details => details, :confirmed_at => Time.now, :uid => uid, :provider => provider, :secret => secret, :oauth_token => token
      user.save(:validate => false)
    end
    return user
end




end