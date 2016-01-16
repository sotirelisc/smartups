class DashboardController < ApplicationController
  layout 'dashboard'
  
  def index
  end
  
  def interested
    # Get the id of the post the user is interested in.
    post = params[:post_id]
    # Create the interest.
    current_user.interests.create!(post_id: post)
    # Create a notification for the post creator.
    p.user.notifications.create!(text: "is interested in", post_id: post)
  end
  
  private
  
    def get_interested_notifications
      @notifications = []
      current_user.notifications.each do |n|
        @notifications << "#{n.user_id.full_name} #{n.text} your #{n.post_id.title} post."
      end
    end
end
