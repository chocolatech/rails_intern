class PostsController < ApplicationController
  before_action :user_signed_in, only: [:destroy, :edit]
  def index
  @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, alert: "Usunięto."
  end

  def new
  @post = Post.new
  end

 def create
     @post = Post.new(post_params)
      if @post.save
      redirect_to posts_path, notice: "Dodano."
    else
      render 'new'
    end
  end  

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:text)
  end

  private def user_signed_in
  if current_user and (current_user.id != params[:id].to_i)
  redirect_to posts_path, alert: "To nie twoje konto"
  end
  true
  end
end