class CeoController < ApplicationController
    include CanCan::ControllerAdditions
  
    # all employees details
    def all_employees
        if current_user.role!= 'CEO'
            render json: { error: 'Only the CEO can access this.' }, status: :unauthorized
            return
          end
        managers = User.where(role: "Manager")
        employees = User.where(role: "Employee")
        render json: { managers: managers, employees: employees }
    end

    # single employee details
    def single_employee
        user = User.find(params[:id])
        if user 
            render json:{ employee: user }, status: 200
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # employees of a specific manager
    def employees_by_manager
        manager = User.find(params[:id])
        employees = manager.employees
        render json: { manager: manager.firstname, employees: employees}
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Manager not found' }, status: :not_found
      end
  end
  