class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.integer :employee_id
      t.integer :drink_id
      t.integer :quantity
      t.float :total_price

      t.timestamps
    end
  end
end
