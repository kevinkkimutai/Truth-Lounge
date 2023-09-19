class CreateManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :managers do |t|

      t.timestamps
    end
  end
end
