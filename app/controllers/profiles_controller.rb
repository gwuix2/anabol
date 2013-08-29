# coding: utf-8
class ProfilesController < ApplicationController
  
  before_filter :get_user

  load_and_authorize_resource

  def index
    @profiles = (Profile.text_search(params[:query])).order("followers Desc").first(50)
  end

  def show
  	@profile = Profile.find(params[:id])
    @sizes_index = @profile.sizes.order("created_at DESC").first(5)
    @sizes = Size.where(:user_id => @profile.user.id).order("mikor ASC").all

    @new_photo = @profile.photos.new
    @photos = @profile.photos.all
    #graphs
    #@testsuly = Size.where(:user_id => @profile.user.id).order("mikor ASC").collect(&:testsuly).compact
    #@testzsir = Size.where(:user_id => @profile.user.id).order("mikor ASC").collect(&:testzsir).compact
    @testzsir = []
    @testsuly = []
    @mikor_ts = []
    @mikor_tzs = []

    @profile.sizes.order("mikor ASC").each do |size|
      if size.testsuly.nil?
      else
        @testsuly << size.testsuly
        @mikor_ts << size.mikor
      end
    end

    @profile.sizes.order("mikor ASC").each do |size|
      if size.testzsir.nil?
      else
        @testzsir << size.testzsir
        @mikor_tzs << size.mikor
      end
    end

    @times = Size.where(:user_id => @profile.user.id).order("mikor ASC").collect(&:mikor).compact

    @ts = LazyHighCharts::HighChart.new('graph', :style => "height:240px;max-width:380px;" ) do |f|
      f.options[:chart][:defaultSeriesType] = "area"
      f.series(:name=>'Testsúly(kg)', :data=>@testsuly)
      #f.series(:name=>'Testzsír(%)', :data=>@testzsir, :visible => false, opposite: true)
      #f.xAxis(:categories => ["United States", "Japan", "China", "Germany", "France"])
      f.xAxis(:categories => @mikor_ts )
      #f.xAxis(:categories => @mikor_tzs, :visible => false, opposite: true )
    end

    #@tzs = LazyHighCharts::HighChart.new('graph', :style => "height:230px;max-width:380px;" ) do |f|
    #  f.options[:chart][:defaultSeriesType] = "area"
    #  f.series(:name=>'Testzsír(%)', :data=>@testzsir)
    #  f.xAxis(:categories => @mikor_tzs )
    #end

    #workout calendar
    @workout = @profile.workouts.order('mikor ASC').last
    @workouts = @profile.workouts.all
    @workouts_by_date = @workouts.group_by(&:mikor_date)
    # @date = params[:date] ? Date.parse(params[:date]) : Date.today # Ez mire jó?
    if params[:date]
      @year = params[:date].to_date.year
      @month = params[:date].to_date.month 
    else
      @year = Date.today.year
      @month = Date.today.month
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

  def destroy
    @profile = Profile.find(params[:id])
    @user = User.find_by_id(@profile.user_id)
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_path, notice: 'Profil törölve.' }
      format.json { head :no_content }
    end
  end

  def following
    @title = "Following"
    @profile = Profile.find(params[:id])
    @profiles = @profile.followed_profiles
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @profile = Profile.find(params[:id])
    @profiles = @profile.followers
    render 'show_follow'
  end

  #def image
  #  @profile = Profile.find(params[:id])
  #  send_file "#{Rails.root}/tmp/uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}",:disposition => 'inline', :type=>"application/jpg", :x_sendfile=>true
  #end

end
