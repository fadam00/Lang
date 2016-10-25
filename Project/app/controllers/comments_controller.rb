class CommentsController < ApplicationController
  def create
  	@request = Request.find(params[:request_id])
  	@comment = @request.comments.create(comment_params)
  		if @comment.save
  			flash[:success] = "Comment posted!"
  			redirect_to root_url
  		else
  			flash.now[:danger] = "Comment not submitted"
  			redirect_to root_url
  end

  def destroy
  end
end

private

def comment_params
		params.require(:comment).permit(:content)
	end
