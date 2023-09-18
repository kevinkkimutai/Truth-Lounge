class CeoController < ApplicationController
    before_action :authenticate_user!
    load_and_authorize_resource # Load and authorize resources based on abilities
  
    def dashboard
        managers = User.where(role: "Manager")
        employees = User.where(role: "Employee")
        render json: { managers: managers, employees: employees }
    end
  end
  