class SignedInController < InheritedResources::Base
  before_action :authenticate_user!
  actions :all, :except => [:new]
end
