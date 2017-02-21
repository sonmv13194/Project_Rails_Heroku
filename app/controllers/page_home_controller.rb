class PageHomeController < ApplicationController
  def home
     if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = Micropost.all.paginate(page: params[:page])
      #@users = User.paginate(page: params[:page])
      # @comments = Comment.where(micropost_id: @micropost).order("created_at DESC")
        if params[:search]
      @users = User.search(params[:search]).order("created_at DESC")
    else
      @users = User.all.order("created_at DESC")
    end
    end
  end

  def help
  end

  def about
  	
  end
  def contact
  	
  end
  def signup
    
  end
  
end
