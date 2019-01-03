class PostsController < ApplicationController
	before_action :authenticate_user!

  def index; end

  def show; end

  def edit
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.create(post_params)
    redirect_to controller: :users, action: :index
  end

  def update
  	post = Post.find(params[:id])
  	post.update(post_params) if post.user_id == current_user.id
    redirect_to controller: :users, action: :show, id: post.user_id
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy if post.user_id == current_user.id
    redirect_to controller: :users, action: :show, id: post.user_id
  end

  private
  def post_params
    params.require(:post).permit(:title, :author, :quote, :comment).merge(user_id: current_user.id)
  end
end
