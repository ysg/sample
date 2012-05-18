require 'spec_helper'

describe "Create recipes" do
  before do
    Factory(:item)
  end
  it "should redirect to login path when user is not logged in", :js => false do
    visit(root_path)
    click_button('Create New Recipe')
    current_path.should == login_path
  end

  it "should redirect user to new_recipe_path on login", :js => true do
    visit(root_path)
    click_button('Create New Recipe')
    current_path.should == login_path

    #@identity = Factory(:identity)
    #@user = Factory(:user, :provider => "identity", :uid => @identity.id, :display_name => @identity.name)
    #fill_in('auth_key', :with => 'test+1@gmail.com')
    #fill_in('password', :with => 'jjjjjj')
    #click_button 'Login'

    click_link 'register'
    fill_registration_form

    current_path.should == new_recipy_path
    Recipy.count.should eq(0)
  end

  it "should be able to create a recipe", :js => true do
    visit(root_path)
    click_button('Create New Recipe')
    current_path.should == login_path
    click_link 'register'
    fill_registration_form
    current_path.should == new_recipy_path
    Recipy.count.should eq(0)
    within("#recipy_ingredients tr:nth-of-type(2)") do
      find('select.ingredient_name').select('item-1')
      find('.ingredient_amount').set('5')
    end
    within("#recipy_ingredients tr:nth-of-type(3)") do
      find('select.ingredient_name').select('item-1')
      find('.ingredient_amount').set('10')
    end
    fill_in('recipy_price_on_menu', :with => '200')
    click_button("Create Recipy")
    Recipy.count.should eq(1)
  end

  it "should be able to add ingredient", :js => true do
    Factory(:item)
    Factory(:item)
    Factory(:item)
    visit(root_path)
    click_button('Create New Recipe')
    current_path.should == login_path
    click_link 'register'
    fill_registration_form
    current_path.should == new_recipy_path
    Recipy.count.should eq(0)
    within("#recipy_ingredients tr:nth-of-type(2)") do
      find('select.ingredient_name').select('item-1')
      find('.ingredient_amount').set('5')
    end
    within("#recipy_ingredients tr:nth-of-type(3)") do
      find('select.ingredient_name').select('item-2')
      find('.ingredient_amount').set('12')
    end
    click_link "Add Ingridients"
    within("#recipy_ingredients tr:nth-of-type(4)") do
      find('select.ingredient_name').select('item-3')
      find('.ingredient_amount').set('30')
    end
    fill_in('recipy_price_on_menu', :with => '200')
    click_button("Create Recipy")
    Recipy.count.should eq(1)
    Ingridient.count.should eq(3)
  end

  it "should be able to remove ingridient", :js => true do
    visit(root_path)
    click_button('Create New Recipe')
    current_path.should == login_path
    click_link 'register'
    fill_registration_form
    current_path.should == new_recipy_path
    Recipy.count.should eq(0)
    within("#recipy_ingredients tr:nth-of-type(2)") do
      find('select.ingredient_name').select('item-1')
      find('.ingredient_amount').set('5')
    end
    within("#recipy_ingredients tr:nth-of-type(2)") do
      click_link "remove"
    end
    fill_in('recipy_price_on_menu', :with => '200')
    click_button("Create Recipy")
    Recipy.count.should eq(1)
    Ingridient.count.should eq(1)
  end

  it "should check the sum to be correct", :js => true do
    Factory(:item)
    Factory(:item)
    Factory(:item)
    visit(root_path)
    click_button('Create New Recipe')
    current_path.should == login_path
    click_link 'register'
    fill_registration_form
    current_path.should == new_recipy_path
    Recipy.count.should eq(0)
    within("#recipy_ingredients tr:nth-of-type(2)") do
      find('select.ingredient_name').select('item-1')
      find('.ingredient_amount').set('5')
    end
    within("#recipy_ingredients tr:nth-of-type(3)") do
      find('select.ingredient_name').select('item-2')
      find('.ingredient_amount').set('10')
    end
    click_link "Add Ingridients"
    within("#recipy_ingredients tr:nth-of-type(4)") do
      find('select.ingredient_name').select('item-3')
      find('.ingredient_amount').set('15')
    end
    click_link "Add Ingridients"
    within("#recipy_ingredients tr:nth-of-type(5)") do
      find('select.ingredient_name').select('item-4')
      find('.ingredient_amount').set('20')
    end
    fill_in('recipy_price_on_menu', :with => '600')
    page.find(".recipy_recipe_cost").click
    #sleep 2
    page.find(".recipy_recipe_cost").text.should eq("500.00")
    page.find(".recipy_profit").text.should eq("100.00")
    page.find(".recipy_food_cost").text.should eq("83.33")
    click_button("Create Recipy")
    Recipy.count.should eq(1)
    Ingridient.count.should eq(4)
  end

end

describe "Edit recipes" do
  before do
    #4.times{Factory(:item)}
    #@recipy = Recipy.create(:price_on_menu=>600, :recipe_cost=>500, :profit=>100, :food_cost=>83.33)
    #4.times do |i|
    #  amount = 5*(i+1)
    #  portion_cost = amount * (Item.all[i].unit_cost)
    #  Ingridient.create(:recipy_id => @recipy.id, :item_id => (i+1), :amount => amount, :unit => "gram", :portion_cost => portion_cost )
    #end
    #@identity = Factory(:identity)
    #@user = Factory(:user, :provider => "identity", :uid => @identity.id, :display_name => @identity.name)
    #visit(login_path)
    #fill_in('auth_key', :with => 'test+1@gmail.com')
    #fill_in('password', :with => 'jjjjjj')
    #click_button 'Login'

    Factory(:item)
    Factory(:item)
    Factory(:item)
    Factory(:item)
    visit(root_path)
    click_button('Create New Recipe')
    current_path.should == login_path
    click_link 'register'
    fill_registration_form
    current_path.should == new_recipy_path
    Recipy.count.should eq(0)
    within("#recipy_ingredients tr:nth-of-type(2)") do
      find('select.ingredient_name').select('item-1')
      find('.ingredient_amount').set('5')
    end
    within("#recipy_ingredients tr:nth-of-type(3)") do
      find('select.ingredient_name').select('item-2')
      find('.ingredient_amount').set('10')
    end
    click_link "Add Ingridients"
    within("#recipy_ingredients tr:nth-of-type(4)") do
      find('select.ingredient_name').select('item-3')
      find('.ingredient_amount').set('15')
    end
    click_link "Add Ingridients"
    within("#recipy_ingredients tr:nth-of-type(5)") do
      find('select.ingredient_name').select('item-4')
      find('.ingredient_amount').set('20')
    end
    fill_in('recipy_price_on_menu', :with => '600')
    page.find(".recipy_recipe_cost").click
    page.find(".recipy_recipe_cost").text.should eq("500.00")
    page.find(".recipy_profit").text.should eq("100.00")
    page.find(".recipy_food_cost").text.should eq("83.33")
    click_button("Create Recipy")
    visit(recipies_path)
    within("table tr:nth-of-type(2)") do
      click_link "Edit"
    end
  end

  it "should be able to edit a recipe", :js => true do
    current_path.should == edit_recipy_path(Recipy.first.id)
  end

  it "should be able to add ingredient", :js => true do
    click_link "Add Ingridients"
    within("#recipy_ingredients tr:nth-of-type(5)") do
      find('select.ingredient_name').select('item-2')
      find('.ingredient_amount').set('5')
    end
    fill_in('recipy_price_on_menu', :with => '300')
    click_button("Update Recipy")
    Ingridient.count.should eq(5)
  end

  it "should be able to remove ingridient", :js => true do
    within("#recipy_ingredients tr:nth-of-type(5)") do
      click_link "remove"
    end
    click_button("Update Recipy")
    Ingridient.count.should eq(3)
  end

  it "should check the sum to be correct", :js => true do
    within("#recipy_ingredients tr:nth-of-type(4)") do
      click_link "remove"
    end
    within("#recipy_ingredients tr:nth-of-type(5)") do
      find('select.ingredient_name').select('item-2')
      find('.ingredient_amount').set('5')
    end
    fill_in('recipy_price_on_menu', :with => '300')
    page.find(".recipy_recipe_cost").click
    page.find(".recipy_recipe_cost").text.should eq("200.00")
    page.find(".recipy_profit").text.should eq("100.00")
    page.find(".recipy_food_cost").text.should eq("66.67")
    click_button("Update Recipy")
    Recipy.count.should eq(1)
    Ingridient.count.should eq(3)
  end
end