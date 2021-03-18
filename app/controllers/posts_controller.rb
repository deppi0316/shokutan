class PostsController < ApplicationController
  before_action :set_q, only: [:index, :show, :search]

  def index
    @tags = Post.tag_counts_on(:tags).most_used(10)
    if @tag = params[:tag]
      @post = Post.tagged_with(params[:tag]).order(created_at: :desc)
    end
    if params[:tag_name]
      @posts = Post.tagged_with("#{params[:tag_name]}").order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "投稿しました！"
      return redirect_to root_path
    else
      render "new"
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
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
  end

  def search
    @results = @q.result(distinct: true)
  end

  private
    def post_params
      params.require(:post).permit(:title, :content, :ec_url , :delivery_url, :prefecture_id, :genre_id, :file, :tag_list).merge(user_id:current_user.id)
    end

    def set_q
      @q = Post.ransack(params[:q])
    end

end