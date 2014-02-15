class HomeController < ApplicationController
  expose(:accounts) {
    accounts = current_user.accounts.sort_by { |a| a.contact.firstname }
    AccountDecorator.decorate_collection(accounts)
  }
end
