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
end
