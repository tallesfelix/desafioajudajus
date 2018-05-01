class AddUserIdToCauses < ActiveRecord::Migration[5.2]
  def change
    add_column :causes, :user_id, :integer
    add_index :causes, :user_id
  end
end
