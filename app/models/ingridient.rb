class Ingridient < ActiveRecord::Base
  belongs_to :recipy
  belongs_to :item

  attr_accessible :amount, :portion_cost, :unit, :recipy_id, :item_id
end
