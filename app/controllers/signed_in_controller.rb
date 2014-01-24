class SignedInController < InheritedResources::Base
  before_action :authenticate_user!
end
