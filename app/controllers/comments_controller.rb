class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def show
    @article = Article.find(params[:id])
    @comment = @article.comments.build
  end

  def edit
    @comment = Comment.find(params[:id])
    @article = Article.find(params[:article_id])
  end

  def update

    @article = Article.find(params[:id])

    @comment = Comment.find(params[:id])
    @comment.update_attributes(params[:comment])
    if @article.update(article_params)
        redirect_to @article
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
