class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :type
      t.string :uom
      t.float :quantity
      t.float :estimated_price

      t.timestamps null: false
    end
  end
end
