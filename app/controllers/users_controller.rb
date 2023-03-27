# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  # def new
  #   @user = User.new
  # end

  # def create
  #   @user = User.new(user_params)

  #   if @user.save
  #     redirect_to root_url, notice: 'Add User'
  #     logger.debug ("-----------")
  #     redirect_to root_url, notice: t('controllers.common.notice_add_user', name: User.model_name.human)
  #   else
  #     render :new
  #   end
  # end

  # private

  # def user_params
  #   params.require(:user, {}).permit(:name, :avatar)
  # end
end
