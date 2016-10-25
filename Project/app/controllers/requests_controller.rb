class RequestsController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def create
    @request = current_user.requests.build(request_params)
    if @request.save
      flash[:success] = "Request created!"
      redirect_to root_url
    else
    	@feed_itmes = []
    	render 'static_pages/home'
	end

	def destroy
	end

end

	private

	def request_params
		params.require(:request).permit(:content)
	end
end

