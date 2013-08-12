class StaticPagesController < ApplicationController

  before_filter :get_profile

  def home
    if user_signed_in?
      redirect_to current_user.profile if current_user.profile
    else
    end

  end

  def about
  end

  def help
  end

  def faq
  end

  def contact
  end

  def meta
    @no_nav = true
    @meta_report = current_user.profile.meta_reports.new
  end

  def adatvedelem
  end

  def feltetelek
  end

  def users
    @users = User.all
  end
end
