class Payment < ActiveRecord::Base
  belongs_to :creditor, class_name: "User"
  belongs_to :debitor, class_name: "User"

  default_scope { order(id: :desc) }
  scope :of_current_month, -> { where("created_at > ?", Date.today.beginning_of_month) }
  
  def is_debt?(current_user)
    current_user.id == debitor_id
  end
end
