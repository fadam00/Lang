class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show, :destroy, :watching, :watchers]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, 	only: :destroy

  def new
  	@user = User.new
  end 

  def index
  	@users = User.order('created_at DESC').paginate(page: params[:page], per_page: 7)
  end

  def show
  	@user = User.find(params[:id])
    @request = current_user.requests.build
    @feed_items = current_user.feed.paginate(page: params[:feed_page], per_page: 4)
  	@requests = @user.requests.paginate(page: params[:requests_page], per_page: 4)
    
  end

 def create
    @user = User.new(user_params)
    if @user.save
    	log_in @user
    	flash[:success] = "Welcome to Lang!"
    	redirect_to root_url 
    else
      render 'new'
    end
  end

  def edit
  	 @user = User.find(params[:id])
  end

  def update
 	  @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
  	User.find(params[:id]).destroy
  	flash[:success] = "User deleted"
  	redirect_to users_url
  end

  def watching
    @title = "Watching"
    @user  = User.find(params[:id])
    @users = @user.watching.paginate(page: params[:page])
    render 'show_watch'
  end

  def watchers
    @title = "Watchers"
    @user  = User.find(params[:id])
    @users = @user.watchers.paginate(page: params[:page])
    render 'show_watch'
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role)
    end

    def correct_user
    	@user = User.find(params[:id])
    	redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
    	redirect_to(root_url) unless current_user.admin?
    end
end
