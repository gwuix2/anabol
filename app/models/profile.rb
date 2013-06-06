class Profile < ActiveRecord::Base
  attr_accessible :name, :user_id,:date_of_birth, :nem2, :magassag, :varos, :gym, :image, :real_name, :user_name, :sport, :description, :private

  validates_uniqueness_of :slug

  extend FriendlyId
  friendly_id :user_name, use: :slugged

  has_many :sizes, :dependent => :destroy
  has_many :workouts, :dependent => :destroy
  has_many :meta_reports

  belongs_to :user

  mount_uploader :image, ImageUploader
end
