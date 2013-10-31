class AddUserIdToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :user_id, :integer
    add_index :marks, :user_id
  end
end
