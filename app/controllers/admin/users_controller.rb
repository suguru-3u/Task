class Admin::UsersController < ApplicationController
  before_action :if_not_admin

  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path
  end


  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end
end
