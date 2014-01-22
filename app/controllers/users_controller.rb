class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def index
    if current_user.is_admin
      @users = User.all
    else
      redirect_to user_path(id: current_user.id)
    end
  end

  def show    
    redirect_to root_path unless current_user.id == @user.id    
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end    
  
  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:firstname, :lastname)
  end
  
end
