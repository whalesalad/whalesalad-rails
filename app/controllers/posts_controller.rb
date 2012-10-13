class PostsController < ApplicationController
  respond_to :html, :xml, :json, :atom

  def index
    @title = 'welcome'

    if params[:tag]
      @tag = Tag.find_by_slug(params[:tag])
      @base = @tag.posts
      @title = "tagged #{@tag}"
    else
      @base = Post
    end
    
    @posts = @base.where(:published => true).order('created_at DESC').page(params[:page]).per(5)

    respond_with @posts
  end

  def show
    @post = Post.find_by_slug(params[:id])    
  end

  protected

  def fetch_post
    @post = Post.find_by_slug(params[:id])
  end

end
