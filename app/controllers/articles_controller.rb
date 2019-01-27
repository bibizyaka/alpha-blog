class ArticlesController < ApplicationController
 
# before_action @articles = Article.all

 def index
   @articles = Article.all
 end
  def new
    @article = Article.new
  end
  def show 
     @article = Article.find(params[:id])
  end
  
  def create
    
    # render plain: params[:article].inspect
    @article = Article.new article_params
    if @article.save
      flash[:notice] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'  # show new template instead
    end
    
  end #create
  
  def edit
    @article = Article.find(params[:id])
  end #edit
  
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'update'  
    end
  end
  
  
  private
  
    def article_params
      params.require(:article).permit(:title, :description)
    end

end #class
