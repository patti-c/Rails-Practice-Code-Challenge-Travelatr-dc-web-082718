class PostsController < ApplicationController

  before_action(:find_post, {only: [:show, :edit, :update]})

  def new
    @post = Post.new
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @bloggers = Blogger.all
    @destinations = Destination.all
  end

  def update
    if params[:post][:liked] == "liked"
      @post.likes += 1
    end
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def show
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :likes)
  end

end
