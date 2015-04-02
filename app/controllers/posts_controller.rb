class PostsController < ApplicationController
  include Yelp::V2::Search::Request

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def search
    client = Yelp::Client.new
    request = GeoPoint.new(
               :term => params[:term],
               :category_filter => params[:category_filter],
               :limit => 10,
               :radius_filter => 8047,
               :latitude => 38.854082, #params[:latitude],
               :longitude =>  -77.048884) #params[:longitude])
    response = client.search(request)
    @result = response["businesses"]
    #render json: { results: [] }
  end

  private
    def post_params
      params.require(:post).permit(:title, :body)
      #params.permit("title", "body")
    end

  end