class Payment < ActiveRecord::Base
  belongs_to :creditor, class_name: "User"
  belongs_to :debitor, class_name: "User"

  default_scope { order(id: :desc) }
  
  def of_current_month?(beginning_of_month)
    created_at > beginning_of_month
  end
  
  def is_credit?(current_user)
    current_user.id == creditor_id
  end
  
  def is_debt?(current_user)
    !is_credit?(current_user)
  end
end
