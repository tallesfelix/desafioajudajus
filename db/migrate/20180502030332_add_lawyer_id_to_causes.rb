class AddLawyerIdToCauses < ActiveRecord::Migration[5.2]
  def change
    add_column :causes, :lawyer_id, :integer
  end
end
