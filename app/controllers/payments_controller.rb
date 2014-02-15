class PaymentsController < SignedInController
  expose(:payment, attributes: :payment_params)
  expose(:debts)
  expose(:purchases)
  expose(:payments_by_date) {
    payments = PaymentDecorator.decorate_collection(Payment.of_current_month)
    payments.group_by { |p| p.created_at.to_date }
  }
   
  def create
    payed_by_me = params[:payed_by_me]
    debitor_id = params[:payment][:debitor]    
    creditor_id = current_user.id
    amount = params[:amount]
    
    unless payed_by_me
      creditor_id, debitor_id = debitor_id, creditor_id
    end
    
    success = Payment.create!(creditor_id: creditor_id,
                              debitor_id: debitor_id,
                              amount: amount)
    if payed_by_me
      flash_notice(t('event.success-add-credit', value: amount, user_name: User.find(debitor_id).firstname))
    else
      flash_notice(t('event.success-add-debt', value: amount, user_name: User.find(creditor_id).firstname))
    end
          
    redirect_to action: :index
  end

  def destroy
    flash_notice t('event.success-delete-payment')
    payment.destroy
    redirect_to action: :index
  end

  private
  
  def payment_params
    params.require(:payment).permit(:amount, :debitor, :payed_by_me)
  end  
end
