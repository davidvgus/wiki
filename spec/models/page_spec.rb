require 'spec_helper'

describe Page do

  it "has many collaborators" do
    page = create(:page)

    expect{page.collaborators}.not_to raise_error
  end
end
