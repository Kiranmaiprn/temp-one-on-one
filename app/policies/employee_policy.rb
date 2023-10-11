class EmployeePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  attr_reader :employee, :record
    def initialize(employee, record)
      @employee = employee
      @record = record
    end

    def index
      @employee.role == 'ur_hr'
    end

    def create
      @employee.role == 'ur_hr'
    end

    def update
      @employee.id == @record.id
    end

    def destroy
      @employee.id == @record.id
    end

    def show
      @employee.id == @record.id
    end
  
end
