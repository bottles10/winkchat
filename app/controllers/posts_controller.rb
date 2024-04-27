class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: %i[show edit update destroy]
  before_action :check_owner, only: %i[edit update destroy]

  
  def index
    @pagy, @posts = pagy(Post.all.order(created_at: :desc))
  end

  def show
  end

  def new 
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "New post created successfully!"
    else
      flash.now[:alert] = "Post not saved. Please check form!"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "Post updated successfully!"
    else
      flash.now[:alert] = "Update failed. Please check the form!"
      render :edit, status: :unprocessable_entity 
    end
end

  def destroy
    @post.destroy
    redirect_to posts_path, alert: "Post successfully destroyed!"
  end
  private

  def find_post
    @post = Post.find(params[:id])
  end

  def check_owner
    
    unless current_user == @post.user
      redirect_to posts_path, alert: "You do not own this Post!"
    end
  end

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
