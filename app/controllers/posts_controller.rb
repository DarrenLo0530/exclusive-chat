class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_member!, only: [:new, :create]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = current_member.posts.build
  end

  def create
    @post = current_member.posts.build(post_params)
    if @post.save
      redirect_to root_path, notice: "Succesfully created post!"
    else
      flash.now.alert = "Missing fields!"
      render :new
    end
  end
  
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
