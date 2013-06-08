# coding: utf-8
class SizesController < ApplicationController
  
  before_filter :get_user

  load_and_authorize_resource

  def index
    @sizes = @profile.sizes.all
  end

  def new
    @size = @profile.sizes.new
  end

  def update
  	@size = @profile.sizes.find(params[:id])

    respond_to do |format|
      if @size.update_attributes(params[:size])
        format.html { redirect_to root_path, notice: 'Mérésed sikeresen frissítetted.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @size.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @size = @profile.sizes.find(params[:id])
  end


  def create
    @size = @profile.sizes.new(params[:size])

    @size.user_id = current_user.id
    if @size.save
      redirect_to root_path, notice: "Új mérés elmentve."
    else
      render :new
    end
  end

  def destroy
    @size = Size.find(params[:id])
    @size.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Mérés törölve.' }
      format.json { head :no_content }
    end
  end
end