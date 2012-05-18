require 'spec_helper'

describe Identity, "Relations" do
end

describe Identity, "Validations" do
  before do
    @identity = Factory(:identity)
  end

  subject { @identity }

  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:email) }
end