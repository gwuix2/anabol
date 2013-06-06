class Size < ActiveRecord::Base
  attr_accessible :user_id, :testsuly, :testzsir, :nyak, :mell, :vall, :kar, :alkar, :derek, :csipo, :comb, :vadli, :mikor

  validates :mikor, :presence => true

  belongs_to :profile

  after_create :checkme
  before_save :checkthetime

  def checkme
  	if self.empty?
  		self.destroy
  	end
  end

  def empty?
    ignored_attrs = {'id' => 1, 'created_at' => 1, 'updated_at' => 1, 'user_id' => 1, 'mikor' => 1}
    self.attributes.all?{|k,v| v.blank? || ignored_attrs[k]}
  end

  def checkthetime
    if self.mikor.nil?
      self.mikor = Time.now
    end
  end

end
