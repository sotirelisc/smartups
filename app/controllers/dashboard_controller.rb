class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  
  def index
    get_interested_notifications
  end
  
  def profile
    if params[:id]
      @user = User.find_by_id(params[:id])
    else
      @user = current_user
    end
  end
  
  def interested
    # Get the id of the post the user is interested in.
    post = params[:post_id]
    # Create the interest.
    current_user.interests.create!(post_id: post)
    # Create a notification for the post creator.
    p.user.notifications.create!(text: "is interested in", user_id: current_user.id, post_id: post)
  end
  
  private
  
    def get_interested_notifications
      @notifications = []
      current_user.notifications.each do |n|
        notification = Hash.new
        other_user = User.find_by_id(n.user_id)
        notification[:text] = "#{other_user.full_name} #{n.text} your #{n.post.title} post."
        notification[:when] = n.created_at
        notification[:redirect] = n.user
        @notifications << notification
      end
    end
end
