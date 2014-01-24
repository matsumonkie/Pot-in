class UsersController < SignedInController
  actions :except => [:create]

  private

  def permitted_params
    params.permit(:user => [:firstname, :lastname])
  end
end
