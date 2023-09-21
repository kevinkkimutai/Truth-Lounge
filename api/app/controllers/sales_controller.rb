class SalesController < ApplicationController
    include CanCan::ControllerAdditions

    def create
      sale = Sale.new(sale_params)
      sale.employee_id = current_user.id
    
      if sale.save
        render json: { sale: sale }, status: :created
      else
        render json: { errors: sale.errors.full_messages }, status: :unprocessable_entity
      end
    end
    
     # List all sales
      def index
        sales = Sale.all
        render json: { sales: sales }
      end

      # sales of the current user
      def employee_sales
        sales = Sale.where(employee_id: current_user.id)
        render json: { sales: sales }
      end
      
    
      private
    
      def sale_params
        params.require(:sale).permit(:drink_id, :quantity, :total_price)
      end
end

