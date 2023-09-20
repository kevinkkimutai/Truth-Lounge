class DrinksController < ApplicationController
    include CanCan::ControllerAdditions

 # add drink
 def create_drink
  if current_user&.manager?
    drink = Drink.new(drink_params)

    # Set the manager_id to the ID of the logged-in Manager
    drink.manager_id = current_user.id if current_user&.manager?

    puts "Drink manager_id: #{drink.manager_id}" # Add this line to check the value of drink.manager_id

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
  
  # drinks by a specific manager
  def drinks_by_manager
    manager_id = params[:manager_id]
    drinks = Drink.where(manager_id: manager_id)
    render json: { drinks: drinks }
  end
  

 # update drink
def update_drink
  drink = Drink.find(params[:id])

  if drink.manager_id == current_user.id
    if drink.update(drink_params)
      render json: { drink: drink }, status: :ok
    else
      render json: { errors: drink.errors.full_messages }, status: :unprocessable_entity
    end
  else
    render json: { error: 'Only the manager who added the drink can update it' }, status: :unauthorized
  end
end

  # delete drink
  def destroy_drink
    drink = Drink.find(params[:id])

    if drink.manager_id == current_user.id
      drink.destroy
      render json: { message: 'Drink deleted successfully' }, status: :ok
    else
      render json: { error: 'Only the manager who added the drink can delete it' }, status: :unauthorized
    end
  end


    private
  
    def drink_params
      params.require(:drink).permit(:name, :brand, :capacity, :price)
    end
    
end
