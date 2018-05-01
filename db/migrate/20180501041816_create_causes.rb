class CreateCauses < ActiveRecord::Migration[5.2]
  def change
    create_table :causes do |t|
      t.string :problem
      t.string :origin
      t.string :destiny
      t.string :company
      t.text :description

      t.timestamps
    end
  end
end
