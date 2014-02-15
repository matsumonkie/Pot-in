class Account < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :contact, class_name: "User"

  def add_to_balance(amount)
    update(balance: balance + amount.to_i)
  end

  def sub_to_balance(amount)
    add_to_balance(amount.to_i * -1)
  end
  
  def positive?
    balance > 0
  end

  def negative?
    !positive?
  end
end
