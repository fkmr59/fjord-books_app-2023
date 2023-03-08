class CommentsController < ApplicationController
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      # コメント作成失敗時の処理は後述
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
