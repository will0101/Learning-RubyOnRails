class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :require_same_user, only: [:edit,:update,:destroy]


  def show
    @articles = @user.articles 
  end 

  def new 
    @user = User.new
  end 

  def edit
  end 

  def update
    if @user.update(user_params)
      flash[:notice] = "Your information was updated"
      redirect_to articles_path
    else
      redirect_to "new" 
    end 
  end 

  def show
  end 

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      flash[:notice] = "Welcome to my website #{@user.username}"
      redirect_to articles_path
    else 
      render "new"
    end 
  end
  
  def destroy
    @user.destroy 
    session[:user_id] = nil if @user == current_user
      flash[:notice] = "Account and all articles have been removed"
      redirect_to articles_path 
  end 

  private 
  def user_params
    params.require(:user).permit(:username,:email,:password)
  end 

  def set_user
    @user = User.find(params[:id]) 
  end 

  def require_same_user 
    if current_user != @user  
      flash[:alert] = "You can only edit or delete your own profile"
      redirect_to @user 
    end 
  end 


end
