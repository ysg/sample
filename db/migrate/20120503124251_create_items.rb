class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.float :unit_cost

      t.timestamps
    end
  end
end
