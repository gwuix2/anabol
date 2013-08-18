class Profile < ActiveRecord::Base
  attr_accessible :name, :user_id,:date_of_birth, :nem2, :magassag, :varos, :gym, :image, :real_name, :user_name, :sport, :description, :private, :cover_image

  validates_uniqueness_of :slug

  after_save :set_my_name

  extend FriendlyId
  friendly_id :user_name, use: :slugged
  belongs_to :user

  has_many :sizes, :dependent => :destroy
  has_many :workouts, :dependent => :destroy
  has_many :meta_reports
  has_many :photos, :dependent => :destroy

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_profiles, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower

  
  mount_uploader :image, ImageUploader
  mount_uploader :cover_image, ImageUploader

  def following?(other_profile)
    relationships.find_by_followed_id(other_profile.id)
  end

  def follow!(other_profile)
    relationships.create!(followed_id: other_profile.id)
  end

  def unfollow!(other_profile)
    relationships.find_by_followed_id(other_profile.id).destroy
  end

  def set_my_name
    @user = User.find_by_id(user_id)
    @user.uname = user_name
    @user.save
  end
end
