class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :relationships
  has_many :contacts, :through => :relationships

  has_many :creditors, through: :purchases, source: :contact
  has_many :debtors, through: :debts, source: :user

  has_many :debts, class_name: 'Payment', foreign_key: :contact_id
  has_many :purchases, class_name: 'Payment'

  def payments
    debts + purchases
  end
end
