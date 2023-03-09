# frozen_string_literal: true

class Reports::CommentsController < CommentsController
  before_action :set_imageable

  def edit
    set_imageable
    set_comment
  end

  private

  def set_imageable
    @imageable = Report.find(params[:report_id])
  end

  def render_imageable_show
    @report = @imageable
    render 'reports/show'
  end
end
