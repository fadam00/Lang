class StaticPagesController < ApplicationController  
  def home
  	if logged_in?
  		@request = current_user.requests.build
  		@feed_items = current_user.feed.paginate(page: params[:page], per_page: 7)
  	end
  end

  def help
  end

  def about
  end

  def contact 
  end
end
