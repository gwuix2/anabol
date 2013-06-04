class MetaReport < ActiveRecord::Base
  attr_accessible :description, :name, :image

  belongs_to :profile

  mount_uploader :image, ImageUploader
end
