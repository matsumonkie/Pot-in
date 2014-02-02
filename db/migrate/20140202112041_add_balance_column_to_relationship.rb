class AddBalanceColumnToRelationship < ActiveRecord::Migration
  def change
    add_column :relationships, :balance, :float, default: 0
  end
end
