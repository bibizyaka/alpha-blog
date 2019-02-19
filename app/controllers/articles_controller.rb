class ArticlesController < ApplicationController
 
 before_action :set_article, only: [:edit, :update, :show, :destroy]
 before_action :require_user, except: [:index, :show]
 before_action :require_same_user, only: [:edit, :update, :destroy]
 
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5) 
  end
  def new
    @article = Article.new
  end
  def show 
  #  @article = Article.find(params[:id])
  end
  def destroy
  # @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end
  
  def create
    #  debugger
    # render plain: params[:article].inspect
    @article = Article.new article_params
  #  @article.user = User.first # temporary fix
    @article.user = current_user 
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'  # show new template instead
    end
    
  end #create
  
  def edit
   # @article = Article.find(params[:id])
  end #edit
  
  def update
  #  @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'update'  
    end
  end
  
  
  private
    
    def set_article
      @article = Article.find(params[:id]) 
    end
  
    def article_params
      params.require(:article).permit(:title, :description, category_ids: []) #category_ids are taken from _form.html.erb and checkboxes field  
    end
    
    def require_same_user
     
      if current_user != @article.user and !current_user.admin?
        flash[:danger] = "You can only edit your own articles"
        redirect_to root_path
      end
    end

end #class
