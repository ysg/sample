class Recipy < ActiveRecord::Base
  has_many :ingridients

  accepts_nested_attributes_for :ingridients, :reject_if => :all_blank, :allow_destroy => true

  attr_accessible :food_cost, :price_on_menu, :profit, :recipe_cost, :ingridients_attributes
end
