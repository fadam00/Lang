class RelationshipsController < ApplicationController
	before_action :logged_in_user

	def create
		user = User.find(params[:watched_id])
	    current_user.watch(user)
	    redirect_to user
	end

	def destroy
		user = Relationship.find(params[:id]).watched
    	current_user.unwatch(user)
    	redirect_to user
	end

end
