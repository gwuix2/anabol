# coding: UTF-8
class PhotosController < ApplicationController

  def index
  	#@photos = @profile.photos.all
  end


  def create
  	@profile = current_user.profile
    @photo = @profile.photos.new(params[:photo])
    #@photo.profile_id = current_user.id
    if @photo.save
      redirect_to root_path, notice: "Új mérés elmentve."
    else
      render :new
    end
  end

end