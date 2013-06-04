class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :get_user

  # Globalisan szukseges helperek
  def ido(ido)
    ido.year.to_s + "-" + ido.month.to_s + "-" +  ido.day.to_s
  end

  def get_user
    @user ||= current_user
    @user ||= User.find_by_id(@profile.user_id) if @profile
    @profile ||= current_user.profile if current_user
  end

end
