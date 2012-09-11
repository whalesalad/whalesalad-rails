class PostsController < ApplicationController
  
  def index
    @posts = Post.where(:published => false).order('created_at DESC').page(params[:page]).per(15)

    respond_to do |format|
      format.html
      format.json { render json: @posts }
    end
  end

  def show
    @post = Post.find_by_slug(params[:id])    
  end

  def new
    @post = Post.new
  end

  def create
    if params[:post][:tags]
      tags = []
      
      params[:post][:tags].split(",").each do |tag_name|
        tags.append Tag.find_or_create_by_name(tag_name.strip)
      end

      params[:post][:tags] = tags
    end

    @post = Post.new(params[:post])
    
    if @post.save
      redirect_to @post, notice: 'BOOM look at you blogging like a boss.'
    else
      render action: "new"
    end
  end

  # GET /programs/1/edit
  def edit
    @post = Post.find_by_slug(params[:id])

    unless @program.approved?
      flash[:error] = 'This program has not yet been approved.'
    end
  end

  def tagged
    @tag = Tag.find_by_slug(params[:tag])
    @posts = @tag.posts
  end

end
