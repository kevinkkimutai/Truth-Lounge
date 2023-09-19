class Drink < ApplicationRecord
    belongs_to :manager, class_name: 'User', foreign_key: 'manager_id'

    validates :name, presence: true
    validates :brand, presence: true
    validates :capacity, presence: true
    validates :price, presence: true
   
end
