class CommentsController < ApplicationController
	before_action :search_post
	before_action :search_comment, only: [:destroy]

	def create
		@comment = @micropost.comments.create(params[:comment].permit(:content))
		@comment.user_id = current_user.id
		@comment.save

		if @comment.save 
			flash[:success] = "Comment was created"
			redirect_to micropost_path(@micropost)
		else
			render 'new'
			end
	end

	def destroy
		@comment.destroy
		flash[:success] = "Xóa bình luận success"
		redirect_to micropost_path(@micropost)
	end

	def index
		
	end

	def search_post
		@micropost = Micropost.find(params[:micropost_id])
	end

	def search_comment
		@comment = @micropost.comments.find(params[:id])
	end
	
end
