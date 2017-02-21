class MicropostsController < ApplicationController
  before_action :find_post,       only: [:show, :edit, :update, :destroy]
	before_action :logged_in_user, only:  [:create, :destroy,:edit,:update]
  before_action :correct_user,   only: :destroy

  #Hien thi tat ca cac record trong Model Micropost
  def index
    @feed_items = Micropost.all.paginate(page: params[:page])
  end
  #Hien thi tat ca cac record lien ket
  def show
    @comments = Comment.where(micropost_id: @micropost).order("created_at DESC")
  end

  #Goi ham POST
   def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else

      render 'page_home/home'
    end
  end

	def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end

  def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
  end
    def edit
    @micropost = Micropost.find(params[:id])
  end
  def update
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      flash[:success] = "Micropost update success!"
      redirect_to request.referrer || root_url
    else
      flash.now[:danger] = "Micropost updated failed!"
      redirect_to request.referrer || root_url
  end
end

  private

  def micropost_params
    params.require(:micropost).permit(:title, :content, :picture)
  end

  def find_post
    @micropost = Micropost.find(params[:id])
  end
end

