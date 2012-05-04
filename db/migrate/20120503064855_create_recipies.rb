class CreateRecipies < ActiveRecord::Migration
  def change
    create_table :recipies do |t|
      t.float :price_on_menu
      t.float :recipe_cost
      t.float :profit
      t.float :food_cost

      t.timestamps
    end
  end
end
