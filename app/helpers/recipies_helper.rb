module RecipiesHelper
  def compute_unit_cost(ingridient)
    return "0.0" unless ingridient.id.present?
    gram_cost = Item.find(ingridient.item_id).unit_cost
    case ingridient.unit
      when "gram"
        gram_cost * 1
      when "lb"
        gram_cost * 453.5924
      when "oz"
        gram_cost * 28.3495
    end
  end
end
