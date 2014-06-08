require 'spec_helper'

describe User do
  it "belongs to an account" do
    user = create(:user)

    user.should belong_to :account
  end

  it "by default has a free role" do
    user = create(:user)

    expect( user.role?(:free) ).to eql true
  end

  it "is invalid without a name" do
    expect{create(:user, name: nil)}.to raise_error
  end

  #it "has an account after creation" do
    #user = create(:user)
    #user.should validate_presence_of :account
  #end
end
