class Workout < ActiveRecord::Base
  attr_accessible :description, :mikor, :user_id, :template, :name, :period_time, :mikor_date

  belongs_to :user

  before_save :setmydate

  def setmydate
  	self.mikor_date = self.mikor.to_date if self.mikor
  end
end
