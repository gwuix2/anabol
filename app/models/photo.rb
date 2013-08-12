class Photo < ActiveRecord::Base
  attr_accessible :image, :name, :public, :keszult, :description, :testsuly, :testzsir

  belongs_to :profile

  mount_uploader :image, PhotoUploader
end
