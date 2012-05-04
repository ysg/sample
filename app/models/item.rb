class Item < ActiveRecord::Base
  has_many :ingridients

  attr_accessible :name, :unit_cost
end
