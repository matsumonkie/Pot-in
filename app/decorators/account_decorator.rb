class AccountDecorator < Draper::Decorator
  delegate_all
  decorates_association :contact
end
