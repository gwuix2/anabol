# coding: UTF-8
class PhotosController < ApplicationController

  before_filter :get_profile

  def index
  	@photos = @profile.photos.order("created_at DESC")

    #respond_to do |format|
    #  format.html
    #  format.js {}
    #  format.json { render json: @photos }
    #end
  end


  def create
  	@profile = current_user.profile
    @photo = @profile.photos.new(params[:photo])
    #@photo.profile_id = current_user.id
    if @photo.save
      redirect_to root_path, notice: "Új mérés elmentve."
    else
    end
  end

end