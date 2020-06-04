class UsersController < ApplicationController
  before_action :set_project, only: [:edit, :update, :destroy]
  before_action :baria_user, only: [:update]

  def index
  end

  def edit
  end

  def update
    if @user.update(user_params)
      NotificationMailer.complete_mail(@user).deliver_now 
  		redirect_to users_path, notice: "successfully updated user!"
  	else
  		render :edit
  	end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:introduction,:profile_image)
  end

  def set_project
    @user = User.find(params[:id])
  end

  def baria_user
  	unless params[:id].to_i == current_user.id
  		redirect_to users_path
  	end
   end

end
