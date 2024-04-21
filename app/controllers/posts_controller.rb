class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]
  def index
    @posts = Post.all.order(created_at: :desc).limit(5)
  end

  def show
  end

  def new 
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path, notice: "New post created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @post.update(post_params)

    redirect_to post_path(@post)
  end

  def destroy
    @post.destroy
    redirect_to posts_path, alert: "Post successfully destroyed!"
  end
  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image, :caption)
  end
end
