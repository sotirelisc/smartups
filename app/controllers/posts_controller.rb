class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :correct_user, only: :destroy

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
    else
      @posts = Post.all
    end
  end

  def new
    @post = Post.new
  end
  
  def create
    # For some reason we have to provide again the current user's id.
    @post = current_user.posts.new(post_params.merge(:user_id => current_user.id))
    if @post.save
      flash[:success] = "Successfully created \"#{@post.title}\"!"
      redirect_to action: "index"
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Smartup has been deleted!"
    redirect_to request.referrer || root_url
  end

  private

    def post_params
      params.require(:post).permit(:title, :content, :skill_list)
    end
    
    def correct_user
      @post = current_user.posts.find_by(id: params[:id])
      redirect_to root_url if @post.nil?
    end
    
end