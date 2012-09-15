class Admin::PostsController < AdminController
  before_filter :fetch_post, :only => [:show, :edit, :update, :destroy]
  # cache_sweeper :post_sweeper, only: [:create, :update, :destroy]

  def index
    @posts = Post.order('created_at DESC')
    # @posts = Post.recent.page(params[:page])
    # @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit

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
      redirect_to [:admin, @post], notice: 'BOOM look at you blogging like a boss.'
    else
      render action: "new"
    end
  end

  def update
    if params[:post][:tags]
      tags = []
      
      params[:post][:tags].split(",").each do |tag_name|
        tags.append Tag.find_or_create_by_name(tag_name.strip)
      end

      params[:post][:tags] = tags
    end

    if @post.update_attributes(params[:post])
      flash[:notice] = 'Successfully updated post.'
      redirect_to edit_admin_post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Successfully destroyed post.'
    redirect_to admin_posts_url
  end

  protected

  def fetch_post
    @post = Post.find_by_slug(params[:id])
  end
end
