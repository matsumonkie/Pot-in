class UsersController < SignedInController
  actions :except => [:create]

  private
  
  def user_params
    params.require(:user).permit(:firstname, :lastname)
  end  
end
