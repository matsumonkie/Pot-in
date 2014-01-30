class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :user_id
      t.integer :contact_id
      t.float :amount
      t.integer :label
      t.string :comment

      t.timestamps
    end
  end
end
