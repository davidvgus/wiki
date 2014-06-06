require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature "Authorized free user" do
  scenario "sees own name instead of guest" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit root_path

    expect(page).to have_content(user.name)
    Warden.test_reset!
  end

  scenario "sees wikis he collaborates on" do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    #public pages
    %w{Lions Tigers Bears}.each do |page|
      create(:page, title: page)
    end

    #private pages
    %w{Beers Steers Seers}.each do |page|
      create(:page, title: page, private: true)
    end

    #private pages user collaborates on
    %w{Peanuts Jellies}.each do |page|
      collaborated_page = create(:page, title: page, private: true)
      collaborated_page.collaborators << user
    end


    visit root_path
    expect(page).to have_content("booty")

    Warden.test_reset!
  end

  xscenario "does not see private content" do
    pending
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)


    visit root_path

    expect(page).to have_content(user.name)
    Warden.test_reset!
  end
end
