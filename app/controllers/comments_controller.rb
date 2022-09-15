class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
  
  def edit
    @article = Article.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def update
    debugger
    # @article = Article.find(params[:id])

    @comment = Comment.find(params[:id])
    @comment.update(params[:comment])
    if @comment.update(comment_params)
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
