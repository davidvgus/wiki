require 'spec_helper'

describe User do
  it "belongs to an account" do
    user = create(:user)
    user.should belong_to :account
  end

  #it "has an account after creation" do
    #user = create(:user)
    #user.should validate_presence_of :account
  #end
end
