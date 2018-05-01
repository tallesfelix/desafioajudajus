class AddCausesCountToLawyers < ActiveRecord::Migration[5.2]
  def change
    add_column :lawyers, :causes_count, :integer, default: 0
  end
end
