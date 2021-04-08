class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

  def index 
    @categories = Category.all
  end 

  def show 
    @category = Category.find(params[:id])
  end 

  def new 
    @category = Category.new
  end 


  def create 
    @category = Category.new(category_params)
    if @category.save 
      flash[:notice] = "Category was created"
      redirect_to @category
    else  
      render "new"
    end 
  end 

  private
  def category_params 
    params.require(:category).permit(:name)
  end 

  def require_admin
    if logged_in? == true && current_user.admin? == false
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path
    end 
  end 

end
