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
    Notification.create!(sender_id: current_user.id, recipient_id: Post.find_by_id(post).user, text_msg: "is interested in", post_id: post)
  end
  
  private
  
    def get_interested_notifications
      @notifications = []
      current_user.received_notifications.each do |n|
        notification = Hash.new
        sender = User.find_by_id(n.sender_id)
        notification[:text] = "#{sender.full_name} #{n.text_msg} your #{n.post.title} post."
        notification[:when] = n.created_at
        notification[:redirect] = sender.id
        @notifications << notification
      end
    end
end
