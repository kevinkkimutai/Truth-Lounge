class Sale < ApplicationRecord
  belongs_to :drink
  belongs_to :employee, class_name: 'User'
end
