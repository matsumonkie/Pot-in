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
    signed_amount = if payed_by_me then payment.amount else payment.amount * -1 end
    Payment.create!(user_id: current_user.id, contact_id: payment.contact_id, amount: signed_amount)

    flash_notice(t('event.success-add-payment',
                 buy_or_own: payed_by_me ? t('action.buy') : t('action.own'),
                 determinant: payed_by_me ? t('common.to') : t('common.from'),
                 value: payment.amount,
                 user_name: User.find(payment.contact_id).firstname))
    
    redirect_to action: :index
  end

  def destroy
    flash_notice t('event.success-delete-payment')
    payment.destroy
    redirect_to action: :index
  end

  private
  
  def payment_params
    params.require(:payment).permit(:amount, :contact_id)
  end  
end
