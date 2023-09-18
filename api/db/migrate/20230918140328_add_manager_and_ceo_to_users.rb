# db/migrate/xxxxxx_add_manager_and_ceo_to_users.rb

class AddManagerAndCeoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :manager, foreign_key: { to_table: :users }
    add_reference :users, :ceo, foreign_key: { to_table: :users }
  end
end
