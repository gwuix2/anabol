class Size < ActiveRecord::Base
  attr_accessible :user_id, :testsuly, :testzsir, :nyak, :mell, :vall, :kar, :alkar, :derek, :csipo, :comb, :vadli

  belongs_to :user

  after_create :checkme

  def checkme
  	if self.empty?
  		self.destroy
  	end
  end

  def empty?
    ignored_attrs = {'id' => 1, 'created_at' => 1, 'updated_at' => 1, 'user_id' => 1}
    self.attributes.all?{|k,v| v.blank? || ignored_attrs[k]}
  end
end
