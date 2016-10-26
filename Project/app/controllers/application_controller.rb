class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  rescue_from ActiveRecord::RecordNotFound do
  flash[:warning] = 'Resource not found.'
  redirect_back_or root_path
end

def redirect_back_or(path)
  redirect_to request.referer || path
end


helper_method :mailbox, :conversation
  private

      def logged_in_user
    	unless logged_in?
    		store_location
    		flash[:danger] = "Please log in."
    		redirect_to login_url
    	end
    end

      def conversation
    @conversation ||= mailbox.conversations.find(params[:id])
  end

   def mailbox
    @mailbox ||= current_user.mailbox
  end
end
