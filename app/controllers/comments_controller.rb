class CommentsController < ApplicationController
  before_action :get_article
  before_action :get_comment, only: [:destroy, :update, :show, :edit]
  def index

    @comments = @article.comments.all
  end

  def new

    @comment = @article.comments.new
  end

  def edit


  end

  def show


  end

  def update



    if @comment.update(comment_params)
      redirect_to [@article, @comment]
    else
      render "edit"
    end
  end

  def destroy


    @comment.destroy
    redirect_to @article
  end

  def create

   @comment = @article.comments.new(comment_params)

   if @comment.save
    #redirect_to @article
    respond_to do |format|
      format.json {render json: @comment, status: 201}
    end
   else
     render "new"
   end

  end



  private
  def get_article
        @article = Article.find(params[:article_id])
  end
  def get_comment
        @comment = @article.comments.find(params[:id])
  end
  def comment_params
    params.require(:comment).permit(:commentor, :body, :article_id)
  end

end
