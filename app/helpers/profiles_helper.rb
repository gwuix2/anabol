module ProfilesHelper
  def myprofile?(profile)
  	if profile.private
  	  if user_signed_in?
  	  	if profile.user_id == current_user.id
  	  		true
  	      end
  	  end
  	else
  	  true
  	end
  end
end
