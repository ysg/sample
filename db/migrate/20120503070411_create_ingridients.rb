class CreateIngridients < ActiveRecord::Migration
  def change
    create_table :ingridients do |t|
      t.integer :recipy_id
      t.integer :item_id
      t.float :amount
      t.string :unit
      t.float :portion_cost

      t.timestamps
    end
  end
end
