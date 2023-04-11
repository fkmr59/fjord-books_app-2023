# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]
  before_action :check_author, only: %i[edit update destroy]

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
    if set_comment.update(comment_params)
      redirect_to @imageable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    set_comment.destroy
    redirect_to @imageable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

  def check_author
    return if @comment.user_id == current_user.id

    redirect_to reports_url, alert: t('controllers.common.alert_user', name: Comment.model_name.human)
  end
end
