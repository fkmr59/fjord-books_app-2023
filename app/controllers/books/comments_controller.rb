# frozen_string_literal: true

class Books::CommentsController < CommentsController
  before_action :set_imageable

  def edit
    set_imageable
    set_comment
  end

  private

  def set_imageable
    @imageable = Book.find(params[:book_id])
  end

  def render_imageable_show
    @book = @imageable
    render 'books/show'
  end
end
