class UsersController < SignedInController
  actions :except => [:create, :index]

  private

  def permitted_params
    params.permit(:user => [:firstname, :lastname])
  end
end
