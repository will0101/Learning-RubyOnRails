class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit,:update,:destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit,:update,:destroy]

  def show 
  end

  def index 
    @articles = Article.all()
  end 

  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to @article
    else 
      render "new"
    end
  end 

  def new
    @article = Article.new
  end 

  def edit 
  end 

  def update 
    if @article.update(article_params)
     flash[:notice] = "Article was updated"
     redirect_to @article
    else 
      render "edit"
    end 
  end

  def destroy
    
    if @article.destroy
      flash = "Article was removed"
    else  
      p "Naw" 
    end
  end 

  private
  def find_article
    article_id = params[:id]
    @article = Article.find(article_id)
  end 

  def article_params
    params.require(:article).permit(:title,:description) 
  end 

  def require_same_user 
    if current_user != @article.user && current_user.admin != true
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article 
    end 
  end 

end 