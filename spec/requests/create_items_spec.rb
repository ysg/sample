require 'spec_helper'

describe "Create Items" do
  it "redirect to login path when user is not logged in", :js => false do
    visit(root_path)
    click_button('Create New Item')
    current_path.should == login_path
  end

  it "create item when user is logged in", :js => true do
    visit(root_path)
    click_button('Create New Item')
    current_path.should == login_path
    click_link 'register'
    fill_registration_form
    current_path.should == new_item_path
    Item.count.should eq(0)
    fill_in 'item_name', :with => 'test'
    fill_in 'item_unit_cost', :with => 'test'
    click_button('Create Item')
    Item.count.should eq(1)
  end
end
