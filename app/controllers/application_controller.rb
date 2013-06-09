class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :get_user
  helper_method :get_profile
  before_filter :set_locale, :version_control
  
  def set_locale
    I18n.locale = "hu"
  end

  # Globalisan szukseges helperek
  def ido(ido)
    @year = ido.year.to_s
    @month = ido.month.to_s
    @day = ido.day.to_s
    # + "-" + ido.month.to_s + "-" +  ido.day.to_s
  end

  def get_user
    #@user ||= current_user
    #@user ||= User.find_by_id(@profile.user_id) if @profile
    #@profile ||= current_user.profile if current_user
    #@profile ||= @user.profile if @user
  end

    def get_profile
    @profile = Profile.find(params[:profile_id])
  end

  def version_control
    @version = Version.last
    if @version
    else
      @version = Version.create(v: "v1.0")
    end
  end
end
