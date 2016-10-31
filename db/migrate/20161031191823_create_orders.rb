class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :uom
      t.float :quantity
      t.references :food, index: true, foreign_key: true
      t.references :bag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
