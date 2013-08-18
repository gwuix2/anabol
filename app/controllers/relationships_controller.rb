class RelationshipsController < ApplicationController

  def create
    @profile = Profile.find(params[:relationship][:followed_id])
    current_user.profile.follow!(@profile)
    redirect_to @profile
  end

  def destroy
    @profile = Relationship.find(params[:id]).followed
    current_user.profile.unfollow!(@profile)
    redirect_to @profile
  end
end
