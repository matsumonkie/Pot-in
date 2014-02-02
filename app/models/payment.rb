class Payment < ActiveRecord::Base
  belongs_to :creditor, class_name: "User"
  belongs_to :debitor, class_name: "User"

  def is_debt?(current_user)
    current_user.id == debitor_id
  end
end
