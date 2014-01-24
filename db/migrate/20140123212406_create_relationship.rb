class CreateRelationship < ActiveRecord::Migration
  def change
    create_table :relationship do |t|
      t.integer :user_id, index: true
      t.string :relation_type
      t.integer :contact_id

      t.timestamps
    end
  end
end
