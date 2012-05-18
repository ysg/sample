require 'spec_helper'

describe Item, "Relations" do
  it { should have_many(:ingridients) }
end
