class RelationshipDecorator < Draper::Decorator
  delegate_all
  decorates_association :contact
  decorates_association :user
end
