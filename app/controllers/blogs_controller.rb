class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :set_topic_with_blogs, only: [:show,:index]
  before_action :set_topic , except:[:show,:index]
  access all: [:show, :index], user: {except: [:destroy,:new,:create,:update,:edit,:toggle_status]}, site_admin: :all
  layout "blog"
  # GET /blogs
  # GET /blogs.json
  def index
    conditions={}
    if params[:topic_id]
      conditions.merge! topic_id:params[:topic_id]
    end
    if !logged_in?(:site_admin)
      conditions.merge! status:"1"
    end
      @blogs = Blog.recent.page(params[:page]).per(4).where(conditions)
  end
  
  def toggle_status
    #byebug
    if @blog.draft?
      @blog.published!
    else
      @blog.draft!
    end
    redirect_to blogs_path,notice: "Blog #{@blog.status} "
  end
  # GET /blogs/1
  # GET /blogs/1.json
  def show
    if logged_in?(:site_admin) || @blog.published?
      @blog = Blog.includes(:comments).friendly.find(params[:id])

      @comment=Comment.new
    else
      redirect_to blogs_path,notice: "You are unauthorized to view this page"
    end

  end

  # GET /blogs/new
  def new
    @blog = Blog.new(topic_id:1)
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    def set_topic_with_blogs
      @topics=Topic.topic_with_blogs
    end
    def set_topic
      @topics=Topic.all
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :body,:topic_id)
    end
end
