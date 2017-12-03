class ArticlesController < ApplicationController
  def index
  	@articles = Article.all.order(id: :asc)
  end

  def new
  	@article = Article.new
  end

  def create
  	@article = Article.new(article_params)
  	if @article.save
  		redirect_to article_path(@article)
  	else
  		render 'new'
  	end  	
  end

  def show
  	find_article
  end

  def edit
  	find_article
  end

  def update
	  find_article
	  @article.attributes = article_params
	  if @article.save
  		redirect_to article_path(@article)
  	else
  		render 'edit'
  	end
  end

  def destroy
    find_article
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title,:text)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
