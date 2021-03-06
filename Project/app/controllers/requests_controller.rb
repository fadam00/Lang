class RequestsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]
	before_action :correct_user,	only: :destroy

def new
	@request = Request.new
	end
		
def create
    @request = current_user.requests.build(request_params)
    if @request.save
      flash[:success] = "Request created!"
      redirect_to current_user
    else
    	@feed_items = []
    	render 'static_pages/home'
	end

end

def destroy
		@request = current_user.requests.find(params[:id])
	    @request.destroy
	    flash[:success] = "Request deleted"
	    redirect_to request.referrer || root_url
end


	private

	def request_params
		params.require(:request).permit(:content, :attachment, :language_from, :language_to, :budget)
	end

	

	def correct_user
		@request = current_user.requests.find(params[:id])
		redirect_to root_url if @request.nil?
		end

end

