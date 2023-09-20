class CreateDrinks < ActiveRecord::Migration[7.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :brand
      t.string :capacity
      t.string :price
      t.integer :manager_id

      t.timestamps
    end
  end
end
