class ProfilesController < ApplicationController

  def index
  	@photos = @profile.photos.all
  end

end