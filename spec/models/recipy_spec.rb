require 'spec_helper'

describe Recipy, "Relations" do
  it { should have_many(:ingridients) }
end
