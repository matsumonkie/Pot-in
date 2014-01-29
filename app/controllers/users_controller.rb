class UsersController < SignedInController
#  actions :except => [:create, :index]

  def update    
    flash[:notice] = t('event.success-edit-user', user_name: current_user.decorate.fullname)
    update! { user_path }
  end

  private

  def permitted_params
    params.permit(:user => [:firstname, :lastname])
  end
end
