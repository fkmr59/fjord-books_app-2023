class UsersController < ApplicationController
  def show
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
