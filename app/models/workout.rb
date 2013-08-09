class Workout < ActiveRecord::Base
  attr_accessible :description, :mikor, :user_id, :template, :name, :period_time, :mikor_date, :color
  
  validates :mikor, :name, :presence => true
  validates_uniqueness_of :slug
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :profile

  before_save :setmydate

  def setmydate
  	self.mikor_date = self.mikor.to_date if self.mikor
  end

end
