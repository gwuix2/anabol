class Profile < ActiveRecord::Base
  attr_accessible :name, :user_id,:date_of_birth, :nem2, :magassag, :varos, :gym, :image, :real_name, :user_name, :sport, :description

  belongs_to :user

  mount_uploader :image, ImageUploader
end
