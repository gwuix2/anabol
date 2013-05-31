class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :get_user

  # Globalisan szukseges helperek
  def ido(ido)
    ido.year.to_s + "-" + ido.month.to_s + "-" +  ido.day.to_s
  end

  def get_user
    @profile ||= Profile.find(params[:id]) if params[:id]
    @profile ||= current_user.profile
    @user ||= User.find_by_id(@profile.user_id)
  end

end
