class PaymentsController < SignedInController  
  nested_belongs_to :user

  def index
    @payments = current_user.payments.decorate.sort_by { |payment| - payment[:id] }
  end

  def create
    amount = params[:payment][:amount].to_f
    amount = amount * -1 unless params[:is_buyer]
    recipient = params[:payment][:user]
    Payment.create(user_id: current_user.id, contact_id: recipient, amount: amount)
    
    redirect_to action: :index
  end

  private
  
  def permitted_params
    params.permit(:is_buyer, :payment => [:amount, :user])
  end  
end
