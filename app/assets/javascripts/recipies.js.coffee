# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('.remove_ingredient').live 'click', (event) ->
    $(@).parent().prev().find('input[type=hidden]').val('1')
    $(@).closest('tr').hide()
    compute_total_cost()
    event.preventDefault()

  $('.add_ingridients').live 'click', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(@).data('id'), "g")
    content = $(@).data('fields').replace(regexp,time)
    if $("#recipy_ingredients tr:last").hasClass("zebra_stripe")
      $('#recipy_ingredients tbody').append(content.replace("zebra_stripe",""))
    else
      $('#recipy_ingredients tbody').append(content)
    event.preventDefault()

############## - Cost Calculation Logic - #############

  compute_cost = (row_element) ->
    tr_element = $(row_element).parents('tr')
    amount = $(tr_element).find("input.ingredient_amount").val()
    rate = $(tr_element).find(".ingredient_unit_cost").html()
    total_cost = parseFloat(amount)*parseFloat(rate)
    if(!isNaN(total_cost))
      $(tr_element).find(".ingredient_portion_cost").html( total_cost.toFixed(2) )
      $(tr_element).find(".ingredient_portion_cost_hidden").val( total_cost.toFixed(2) )
    compute_total_cost()

  compute_total_cost = () ->
    total_cost = 0
    for portion_cost in $(".ingredient_portion_cost:visible")
      total_cost += parseFloat($(portion_cost).html())
    total_cost = total_cost.toFixed(2)
    $(".recipy_recipe_cost").html(total_cost)
    $("#recipy_recipe_cost").val(total_cost)
    compute_profit()

  compute_profit = () ->
    cost_price = parseFloat($(".recipy_recipe_cost").html())
    selling_price = parseFloat($("#recipy_price_on_menu").val())
    profit = (selling_price - cost_price).toFixed(2)
    food_cost = ( (cost_price*100) / selling_price ).toFixed(2)
    if(!isNaN(profit))
      $(".recipy_profit").html(profit)
      $("#recipy_profit").val(profit)
    if(!isNaN(food_cost))
      $(".recipy_food_cost").html(food_cost)
      $("#recipy_food_cost").val(food_cost)


  $(".ingredient_name").live 'change', (event) ->
    cost = $(@).find("option:selected").data('cost')
    $(@).parents('tr').find(".ingredient_unit_cost").html(cost)
    $(@).parents('tr').find(".ingredient_unit").val("gram")
    compute_cost($(@))
    event.preventDefault()

  $(".ingredient_unit").live 'change', (event) ->
    gram_cost = $(@).parents('tr').find(".ingredient_name option:selected").data('cost')
    switch $(@).val()
      when "gram"
        new_cost = (gram_cost*1).toFixed(2)
      when "lb"
        new_cost = (gram_cost*453.5924).toFixed(2)
      when "oz"
        new_cost = (gram_cost*28.3495).toFixed(2)
      else
        new_unit = gram_cost
    $(@).parents('tr').find(".ingredient_unit_cost").html(new_cost)
    compute_cost($(@))

  $(".ingredient_amount").live "change", (event) ->
    compute_cost($(@))

  $("#recipy_price_on_menu").live "change", (event) ->
    compute_profit($(@))


