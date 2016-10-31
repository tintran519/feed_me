class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :ingredient

      t.timestamps null: false
    end
  end
end
