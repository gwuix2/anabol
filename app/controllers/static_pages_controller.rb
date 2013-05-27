class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to profile_path(current_user.profile)
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
end
