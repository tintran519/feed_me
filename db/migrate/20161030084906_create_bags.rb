class CreateBags < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.string :name
      t.string :comments
      t.float :estimated_price

      t.timestamps null: false
    end
  end
end
