class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  before_action :autorize_article, only: [:edit, :update, :destroy]


  def index
  	@articles = Article.all.order(id: :asc)
     @articles = @articles.where("? = any(tags)", params[:q]) if params[:q].present?
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
    @article.author = current_user
  	if @article.save
  		redirect_to article_path(@article)
  	else
  		render 'new'
  	end  	
  end

  def show
    @comment = Comment.new(commenter: session[:commenter])
  end

  def edit
   
  end

  def update
	  @article.attributes = article_params
	  if @article.save
  		redirect_to article_path(@article)
  	else
  		render 'edit'
  	end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end


  
  

  private

  def article_params
    params.require(:article).permit(:title,:text,:tags)
  end

  def find_article
    @article = Article.find(params[:id])
  end

  def autorize_article
     if @article.author != current_user
      redirect_to articles_path, alert: "Wypad!"
    end

  end

end
