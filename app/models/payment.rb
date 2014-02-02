class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :contact, class_name: "User"

  #scope :all_payments, where("user_id = ? OR contact_id = ?", user_id, user_id)
end
