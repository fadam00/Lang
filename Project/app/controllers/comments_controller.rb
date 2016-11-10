class CommentsController < ApplicationController
	def new
		@comment = Comment.new
	end

	def create
  		@request = Request.find(params[:request_id])
  		@comment = @request.comments.build(comment_params)
  		@comment.user_id = current_user.id #or whatever is you session name
  		if @comment.save
  			flash[:success] = "Request created!"
   			redirect_to current_user
  		else
    		flash.now[:danger] = "Error"
 		end
	end

	private

	def comment_params
		params.require(:comment).permit(:content)
	end


end
