class DashboardController < ApplicationController
  layout 'dashboard'
  
  def index
  end
  
  def interested
    post = params[:post_id]
    current_user.interests.create!(post_id: post)
  end
end
