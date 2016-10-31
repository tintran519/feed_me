class CreateBags < ActiveRecord::Migration
  def change
    create_table :bags do |t|
      t.string :name
      t.string :comments
      t.float :estimated_price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
