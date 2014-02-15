class Account < ActiveRecord::Base
  belongs_to :user, class_name: "User"
  belongs_to :contact, class_name: "User"
end
