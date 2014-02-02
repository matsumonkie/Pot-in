class RenameColumnUserIdToCreditorIdAndContactIdToDebitorIdForPayment < ActiveRecord::Migration
  def change
    rename_column :payments, :user_id, :creditor_id
    rename_column :payments, :contact_id, :debitor_id
  end
end
