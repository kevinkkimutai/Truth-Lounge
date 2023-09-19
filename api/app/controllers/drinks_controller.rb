class DrinksController < ApplicationController
    include CanCan::ControllerAdditions

 # add drink
 def create_drink
  if current_user&.manager?
    drink = Drink.new(drink_params)

    # Set the manager_id to the ID of the logged-in Manager
    drink.manager_id = current_user.id if current_user&.manager?

    if drink.save
      render json: { drink: drink }, status: :created
    else
      render json: { errors: drink.errors.full_messages }, status: :unprocessable_entity
    end
  else
    render json: { error: 'Only managers can add drinks' }, status: :unauthorized
  end
rescue ActiveRecord::RecordInvalid => e
  render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
end

  # get all drinks 
  def all_drinks
    drinks = Drink.all
    render json: { drinks: drinks }
  end


    private
  
    def drink_params
      params.require(:drink).permit(:name, :brand, :capacity, :price)
    end
    
end
