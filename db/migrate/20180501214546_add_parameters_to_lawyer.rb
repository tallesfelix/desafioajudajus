class AddParametersToLawyer < ActiveRecord::Migration[5.2]
  def change
    add_column :lawyers, :name, :string
    add_column :lawyers, :birth, :date
    add_column :lawyers, :cpf, :string
    add_column :lawyers, :oab, :string
    add_column :lawyers, :state, :string
    add_column :lawyers, :telephone, :string
  end
end
