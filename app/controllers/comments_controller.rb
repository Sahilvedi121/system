class CommentsController < ApplicationController
    before_action :set_comment, only: [:destroy]
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  
   def destroy
      @comment.destroy
    redirect_to article_path(@comment.article), notice: 'Comment was succesfully delete'
  end
 private
    def comment_params
      params.expect(comment: [:commenter, :body])
    end
    def set_comment
      @comment = Comment.find(params[:id])
end
end
