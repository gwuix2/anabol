# coding: utf-8
class SizesController < ApplicationController
  
  before_filter :get_user


  def index
    @sizes = @user.sizes.all
  end

  def new
    @size = @user.sizes.new
  end

  def update
  	@size = @user.sizes(params[:id])
  end

  def create
    @size = @user.sizes.new(params[:size])
    @size.user_id = current_user.id
    if @size.save
      redirect_to root_path, notice: "Új mérés elmentve."
    else
      render :new
    end
  end


end