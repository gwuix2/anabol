class StaticPagesController < ApplicationController

  before_filter :get_user

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
    @meta_report = @profile.meta_reports.new if @profile
  end

  def adatvedelem
  end

  def feltetelek
  end
end
