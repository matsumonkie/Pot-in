class PaymentsController < SignedInController  
  nested_belongs_to :user

  def index
    @payments = current_user.payments.decorate.sort_by { |payment| - payment[:id] }
  end

  def new
  end

  private
  
  def permitted_params
    #params.permit(:relationship => [:email])
  end  
end
