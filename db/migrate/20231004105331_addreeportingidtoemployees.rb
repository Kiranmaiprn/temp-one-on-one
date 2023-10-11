class Addreeportingidtoemployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :reporting_manager_id, :integer 
    rename_column :employees, :employee_id, :employee_no
  end


end
