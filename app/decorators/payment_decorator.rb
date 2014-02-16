class PaymentDecorator < Draper::Decorator
  delegate_all
  decorates_association :creditor
  decorates_association :debitor

  def contact(current_user)
    if object.is_credit?(current_user)
      debitor
    else
      creditor
    end
  end
  
  # 5.0 => 5
  def decorated_amount(current_user)
    if is_credit?(current_user)
      amount.to_i
    else
      amount.to_i * -1
    end         
  end

end
