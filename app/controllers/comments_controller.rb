# frozen_string_literal: true

class CommentsController < ApplicationController

  def edit
    set_imageable
    set_comment
  end

  def create
    @comment = @imageable.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @imageable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      @comments = @imageable.comments
      render_imageable_show
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @imageable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @imageable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private
  
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
