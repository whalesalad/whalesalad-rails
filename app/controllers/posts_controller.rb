class PostsController < ApplicationController
  respond_to :html, :xml, :json, :atom

  def index
    @title = 'michael whalen &mdash; hacker, designer & vagabond'.html_safe
    @posts = Post

    if params[:tag]
      @tag = Tag.find_by_slug(params[:tag])
      @posts = @tag.posts
      @title = "tagged #{@tag}"
    end
    
    @posts = @posts.published.page(params[:page]).per(5)

    respond_with @posts
  end

  def show
    @post = Post.find_by_slug(params[:id])  
  end

end
