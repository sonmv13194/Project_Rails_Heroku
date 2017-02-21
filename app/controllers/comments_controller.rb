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
			flash[:danger] = "Comment failed! Comment have to one letter"
			redirect_to micropost_path(@micropost)
			end
	end

	def destroy
		@comment.destroy
		flash[:success] = "Xóa bình luận success"
		redirect_to micropost_path(@micropost)
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(comment_params)
			flash[:success] = "Comment was updated!"
			redirect_to micropost_path(@micropost)
		else
			flash[:danger] = "Comments was not updated!!"
			redirect_to micropost_path(@micropost)
		end
	end

	def index
		
	end

	def search_post
		@micropost = Micropost.find(params[:micropost_id])
	end

	def search_comment
		@comment = @micropost.comments.find(params[:id])
	end
	
	def comment_params
		params.require(:comment).permit(:content)
	end
end
