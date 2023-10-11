class Addnametoemployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :name, :string
    add_column :employees, :role, :string
    add_column :employees, :employee_id, :string
  end
end
