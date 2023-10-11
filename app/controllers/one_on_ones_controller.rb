class OneOnOnesController < ApplicationController
    before_action :authenticate_employee!
    def index
        @one_on_ones = Employee.where(reporting_manager_id: current_employee.id)
        render json: @one_on_ones, status: 200
    end
    def create
        @employee = current_employee
        # authorize @employee
        @meeting = @employee.one_on_ones.new(one_on_one_params)
        if @meeting.save
            payload= {title: "Hii", description: "First Notification"}
            notification(@meeting.member_id, payload)
            render json: @meeting, status: 200
        else
            render json: @meeting.errors
        end
    end

    def meetings
        @meetings = OneOnOne.where(employee_id: current_employee.id)
        render json: @meetings, status: 200
    end

    private
    def one_on_one_params
        params.require(:one_on_one).permit(:member_id, :employee_id, :date, :time, :repeat_monthly, :flag)
    end

    def notification(member_id, payload)
        NotificationService.send_notification(member_id, payload)
    end
end
