class PaymentsController < SignedInController
  expose(:payment, attributes: :payment_params)
  expose(:debts)
  expose(:purchases)
  expose(:sorted_payments) {
    sorted_payments = current_user.payments.sort_by { |p| p.created_at }.reverse!
    PaymentDecorator.decorate_collection(sorted_payments)
  }
   
  def create
    payed_by_me = params[:payed_by_me]
    debitor_id = params[:payment][:debitor]    
    creditor_id = current_user.id
    amount = params[:amount]
    
    unless payed_by_me
      creditor_id, debitor_id = debitor_id, creditor_id
    end
    
    Payment.create!(creditor_id: creditor_id,
                    debitor_id: debitor_id,
                    amount: amount)
    
    flash_notice(t('event.success-add-payment',
                 buy_or_own: payed_by_me ? t('action.offered') : t('action.owned'),
                 determinant: payed_by_me ? t('common.to') : t('common.from'),
                 value: amount,
                 user_name: (payed_by_me ? User.find(debitor_id) : User.find(creditor_id)).firstname))
    
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
