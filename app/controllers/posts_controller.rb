class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    redirect_to root_path unless @post.user == current_user
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to @post.user
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.user == current_user && @post.update(post_params)
      redirect_to @post.user
    else
      render :edit
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy if @post.user == current_user
    redirect_back(fallback_location: @post.user)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :text, :upvotes, :downvotes, :user_id, :subreddit_id)
  end
end
