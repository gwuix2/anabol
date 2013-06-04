class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :provider, :uid, :name
  # attr_accessible :title, :body
  has_one :profile, :dependent => :destroy
  
  before_create :myprofile
  after_create :get_a_name

  def myprofile
    if self.profile
    else
      Profile.create(user_id: self.id)
    end
  end

  #def get_a_name
  #  if self.profile.user_name
  #  else
  #    self.profile.user_name = user.email.chomp[@]


end
