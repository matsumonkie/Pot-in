class PaymentDecorator < Draper::Decorator
  delegate_all
  decorates_association :creditor
  decorates_association :debitor
end
