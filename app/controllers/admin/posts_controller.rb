class Admin::PostsController < AdminController
  before_filter :get_post, :only => [:show, :edit, :update, :destroy]

  def index
    @posts = Post.order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def edit
    
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to admin_posts_path, notice: 'BOOM look at you blogging like a boss.'
    else
      render action: "new"
    end
  end

  def update
    if params[:destroy]
      flash[:notice] = "Successfully deleted #{@post}."
      @post.destroy
      redirect_to admin_posts_path and return
    end
    
    if @post.update_attributes(post_params)
      flash[:notice] = "Successfully updated #{@post}"
      redirect_to admin_posts_path
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :link, :tag_names, :published)
  end

  def get_post
    @post = Post.find_by_slug(params[:id])
  end
end
