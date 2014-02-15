class HomeController < ApplicationController
  expose(:accounts) {
    AccountDecorator.decorate_collection(current_user.accounts)
  }

end
