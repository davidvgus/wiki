require 'spec_helper'

describe Account do
  it "has one user" do
    account = FactoryGirl.create(:account)
    account.should have_one :user
  end

  it "rejects incorrect plans" do
    expect { Account.create!(plan: "monthly") }.to raise_exception
  end

  it "accepts correct plans" do
    expect { Account.create!(plan: "free") }.to_not raise_exception
    expect { Account.create!(plan: "paid") }.to_not raise_exception
  end
end
