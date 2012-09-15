class PostsController < ApplicationController
  respond_to :html, :xml, :json, :atom

  def index
    @posts = Post.where(:published => true).order('created_at DESC').page(params[:page]).per(15)

    @title = 'welcome'

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
