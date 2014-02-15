class Account < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :contact, class_name: "User"

  def positive?
    balance > 0
  end

  def negative?
    !positive?
  end
end
