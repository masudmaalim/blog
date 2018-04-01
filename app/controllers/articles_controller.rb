class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :get_article, only: [:edit, :update, :destroy, :show]
  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)


    if @article.save
      redirect_to article_path(@article.id)
    else
      render 'new'
    end
  end

  def edit

  end

  def show

    @comment = @article.comments.new
    @comments = @article.comments.all
  end

  def new
    @article = Article.new
  end

  def update



    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end

  end

  def destroy
  @article.destroy
  redirect_to articles_path
  end


  private
  def get_article
    @article = Article.find(params[:id])
  end
  def article_params
   params.require(:article).permit(:title, :text, :checkbox)
  end


end
