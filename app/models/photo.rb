class Photo < ActiveRecord::Base
  attr_accessible :image, :name, :public

  belongs_to :profile

  mount_uploader :image, ImageUploader
end
