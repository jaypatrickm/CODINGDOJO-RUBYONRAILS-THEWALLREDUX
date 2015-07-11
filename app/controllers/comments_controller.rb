class CommentsController < ApplicationController
	def index
	end

	def new
	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:notice] = 'New comment created!'
			redirect_to '/wall', notice: 'Comment was successfully created.'
		else
			flash[:errors] = @comment.errors.full_messages
			redirect_to '/wall'
		end
	end
	private
		def comment_params
			params.require(:comment).permit(:user_id, :message_id, :content)
		end
end
