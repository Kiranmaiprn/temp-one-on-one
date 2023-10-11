class EmployeesController < ApplicationController
    before_action :authorize_employee, except: [:index, :current_employee_info, :all_employees, :subordinates]
    before_action :find_employee, only: [:show, :update, :destroy]
    before_action :call_method

    def index
        @employees = Employee.where(role: "ur_manager")
        render json: @employees
    end

    def show
        render json: @employee, status: 200
    end

    def update
        if @employee.update(employee_params)
            render json: {message: "Employee updated successfully", data: @employee}, status: 200
        else
            render json: {message: "Employee cannot be updated", errors: @employee.errors.full_messages}
        end
    end

    def destroy
        @employee.destroy
        render json: {message: "Employee deleted successfully"}, status: 200
    end

    def current_employee_info
        render json: current_employee, status: :ok
    end

    def subordinates
        @employees = Employee.where(reporting_manager_id: current_employee.id)
        render json: @employees
    end
    def all_employees
        @employees = Employee.all
        render json: @employees
    end


     private

     def authorize_employee
        @employee= current_employee
        unless authorize @employee 
            flash[:alert] = "You are not authorized to perform this action"
        end
     end

     def find_employee
        @employee = Employee.find(params[:id])
     end

     def employee_params
        params.require(:employee).permit(:email, :password, :name, :reporting_manager_id, :role, :employee_no)
     end

     def call_method
        puts "Employee called"
     end
     
end
