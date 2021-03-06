# coding: UTF-8
class Inboxes::DiscussionsController < Inboxes::BaseController
  load_and_authorize_resource
  before_filter :load_and_check_discussion_recipient, :only => [:create, :new]

  def index
    if current_user
      current_user.discussions.order("updated_at Desc").first.mark_as_read_for(current_user) if current_user.discussions.first
    end
    @discussions = current_user.discussions.order("updated_at Desc")
    @discussion = current_user.discussions.order("updated_at Desc").first
    @users = (current_user.blank? ? User.all : User.find(:all, :conditions => ["id != ?", current_user.id]))
  end

  def show
    @discussion.mark_as_read_for(current_user)
    @discussion.messages = @discussion.messages.last(60)

    respond_to do |format|
      format.html { redirect_to discussions_url}
      format.js
      format.json { render json: @discussion }
    end
  end

  def new
    @users = []
    User.order("uname Desc").find(:all, :conditions => ["id != ?", current_user.id]).each do |user|
        @users << user if current_user.profile.following?(user.profile)
    end
    @discussion.messages.build
  end

  def destroy
    @discussion.destroy

    flash[:notice] = t("inboxes.discussions.removed")
    begin
      redirect_to :back
    rescue ActionController::RedirectBackError
      redirect_to discussions_url
    end
  end

  def create
    @discussion.add_recipient_token current_user.id

    @discussion.messages.each do |m|
      m.discussion = @discussion
      m.user = current_user
    end

    if @discussion.save && @discussion.messages.any?
      redirect_to discussions_url, :notice => t("inboxes.discussions.started")
    else
      redirect_to new_discussion_url, notice: "Nem választottál ki címzettet, vagy üres volt az üzeneted."
    end
  end

  def update
    redirect_to discussions_url
  end

  private

  def load_and_check_discussion_recipient
    # initializing model for new and create actions
    @discussion = Discussion.new(params[:discussion].presence || {})

    # checking if discussion with this user already exists
    if @discussion.recipient_ids && @discussion.recipient_ids.size == 1
      user = User.find(@discussion.recipient_ids.first)
      discussion = Discussion.find_between_users(current_user, user)
      if discussion
        # it exists, let's add message and redirect current user
        @discussion.messages.each do |message|
          Message.create(:discussion => discussion, :user => current_user, :body => message.body) if message.body
        end
        # redirecting to that existing object
        redirect_to discussion, :notice => t("inboxes.discussions.already_exists", :user => user[Inboxes::config.user_name])
      end
    end
  end
end