class PaymentsController < SignedInController
  expose(:payment, attributes: :payment_params)
  expose(:debts)
  expose(:purchases)
  expose(:payments) { current_user.payments }

  expose(:payments_by_date) {
    beginning_of_month = Date.today.beginning_of_month
    ps = payments.cmap { |p| p if p.of_current_month?(beginning_of_month) }
    ps = PaymentDecorator.decorate_collection(ps)
    ps.group_by { |p| p.created_at.to_date }
  }

  def create
    payed_by_me = params[:payed_by_me]
    debitor_id = params[:payment][:debitor]
    creditor_id = current_user.id
    amount = params[:amount]

    unless payed_by_me
      creditor_id, debitor_id = debitor_id, creditor_id
    end

    payment = Payment.new(creditor_id: creditor_id,
                          debitor_id: debitor_id,
                          amount: amount)
    if payment.save
      update_account_balance(creditor_id, debitor_id, amount)
      if payed_by_me
        flash_notice(t('event.success-add-credit', value: amount, user_name: User.find(debitor_id).firstname))
      else
        flash_notice(t('event.success-add-debt', value: amount, user_name: User.find(creditor_id).firstname))
      end
    end

    redirect_to action: :index
  end

  def destroy
    update_account_balance(debitor_id, creditor_id, amount)
    flash_notice t('event.success-delete-payment')
    payment.destroy
    redirect_to action: :index
  end

  private

  def update_account_balance(creditor_id, debitor_id, amount)
    account_creditor = Account.where(user_id: creditor_id, contact_id: debitor_id).first
    account_creditor.add_to_balance(amount) if account_creditor
    account_debitor = Account.where(user_id: debitor_id, contact_id: creditor_id).first
    account_debitor.sub_to_balance(amount) if account_debitor
  end

  def payment_params
    params.require(:payment).permit(:amount, :debitor, :payed_by_me)
  end
end
