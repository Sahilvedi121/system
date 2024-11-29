class CommentsController < ApplicationController
  before_action :set_article, only: [:create]
  before_action :set_comment, only: [:destroy]

  def create
    @comment = @article.comments.new(comment_params)  # Initialize comment with article

    # Optionally handle parent comments if you're implementing threaded comments
    if params[:parent_id]
      @comment.parent_id = params[:parent_id]
    end

    if @comment.save
      redirect_to article_path(@article), notice: 'Comment was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@comment.article), notice: 'Comment was successfully deleted.'
  end

  private

  # Permit only the necessary comment parameters
  def comment_params
    params.require(:comment).permit(:commenter, :body)  # Whitelist the allowed params
  end

  # Set the article (for create action)
  def set_article
    @article = Article.find(params[:article_id])  # Assuming article_id is passed in the URL
  end

  # Set the comment (for destroy action)
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
