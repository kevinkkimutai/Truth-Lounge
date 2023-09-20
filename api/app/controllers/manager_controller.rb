class ManagerController < ApplicationController
    include CanCan::ControllerAdditions

    # all employees unsder manager
    def all_employees
        if current_user.role!= 'Manager'
          render json: { error: 'Only the MANAGERS can access this.' }, status: :unauthorized
          return
        end
      
        manager_id = params[:id]
        manager = User.find_by(id: manager_id)
        if manager.nil?
          render json: { error: 'Manager not found' }, status: :not_found
          return
        end
      
        employees = manager.employees
        render json: { employees: employees }
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Manager not found' }, status: :not_found
      end

    #   single employee
    def employee
        if current_user.role!= 'Manager'
          render json: { error: 'Only the MANAGERS can access this.' }, status: :unauthorized
          return
        end
      
        manager_id = params[:id]
        manager = User.find_by(id: manager_id)
        if manager.nil?
          render json: { error: 'Manager not found' }, status: :not_found
          return
        end
      
        employee_id = params[:employee_id]
        employee = User.find_by(id: employee_id)
        if employee.nil?
          render json: { error: 'Employee not found' }, status: :not_found
          return
        end
      
        if employee.manager_id!= manager.id
          render json: { error: 'Employee does not belong to this manager' }, status: :unauthorized
          return
        end
      
        render json: { employee: employee }
      rescue ActiveRecord::RecordNotFound
        render json: { error: 'Employee not found' }, status: :not_found
      end
      
     
end
