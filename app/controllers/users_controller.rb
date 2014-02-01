class UsersController < SignedInController
  expose(:user, attributes: :user_params)
  
  def update    
    if user.save
      flash_notice t('event.success-edit-user')
    else
      flash_alert t('event.error-edit-user')
    end

    redirect_to action: :show
  end

  private

  def user_params
    params.require(:user).permit(:firstname, :lastname)
  end
end
