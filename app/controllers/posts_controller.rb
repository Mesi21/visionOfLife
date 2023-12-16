class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.most_recent_three_posts
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @comments = @post.comments.order(created_at: :desc)
    @likes = @post.likes.all
  end

  def new
    @current = current_user
  end

  def create
    new_post = current_user.posts.build(post_params)

    respond_to do |format|
      format.html do
        if new_post.save
          redirect_to user_post_path(new_post.user_id, new_post.id), notice: 'Post was successfully created.'
        else
          render :new, alert: 'Post was not created.'
        end
      end
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
