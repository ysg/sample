require 'spec_helper'

describe Ingridient, "Relations" do
  it { should belong_to(:recipy) }
  it { should belong_to(:item) }
end