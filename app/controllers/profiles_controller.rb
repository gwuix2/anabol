# coding: utf-8
class ProfilesController < ApplicationController
  
  before_filter :get_user

  def show
  	@profile = Profile.find(params[:id])
    @size = @user.sizes.new
    @sizes_index = @user.sizes.order("created_at DESC").first(5)
    @sizes = Size.where(:user_id => @profile.user.id).all

    @testsuly = Size.where(:user_id => @profile.user.id).collect(&:testsuly).compact
    @testzsir = Size.where(:user_id => @profile.user.id).collect(&:testzsir).compact
    @times = []
    @sizes.each do |testsuly|
      @times << ido(testsuly.created_at)
    end

    @ts = LazyHighCharts::HighChart.new('graph', :style => "height:230px;max-width:380px;" ) do |f|
      f.options[:chart][:defaultSeriesType] = "area"
      f.series(:name=>'Testsúly(kg)', :data=>@testsuly)
      #f.xAxis(:categories => ["United States", "Japan", "China", "Germany", "France"])
      f.xAxis(:categories => @times )
    end
    @tzs = LazyHighCharts::HighChart.new('graph', :style => "height:230px;max-width:380px;" ) do |f|
      f.options[:chart][:defaultSeriesType] = "area"
      f.series(:name=>'Testsúly(kg)', :data=>@testsuly)
      f.series(:name=>'Testzsír(%)', :data=>@testzsir, :visible => false)
      f.xAxis(:categories => @times )
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to @profile, notice: 'Profilod sikeresen frissítetted.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def get_user
      @profile ||= Profile.find(params[:id])
      @user ||= User.find_by_id(@profile.user_id)
    end
end
