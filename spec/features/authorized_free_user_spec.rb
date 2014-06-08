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
    %w{Spheres Fears Tears}.each do |page|
      create(:page, title: page, private: true)
    end

    #private pages user collaborates on
    %w{Peanuts Jellies}.each do |page|
      collaborated_page = create(:page, title: page, private: true)
      collaborated_page.collaborators << user
    end


    visit root_path
    expect(page).to have_content("Lions")
    expect(page).not_to have_content("Spheres")
    expect(page).to have_content("Peanuts")
    expect(page).to have_content("Jellies")

    Warden.test_reset!
  end

  scenario "does not see private content unless it is a joint_page" do
    user = FactoryGirl.create(:user)
    other_user = FactoryGirl.create(:user)
    collaborator_user = FactoryGirl.create(:user)

    login_as(user, :scope => :user)

    others_private_page = FactoryGirl.create(:page,
                                             title: "Private, no collaboration",
                                             private: true,
                                             owner: other_user)

    joint_page = FactoryGirl.create(:page,
                                    title: "Private Joint",
                                    private: true,
                                    owner: collaborator_user)
    joint_page.collaborators << user

    public_page = FactoryGirl.create(:page)

    visit root_path
    expect(page).to have_content(joint_page.title)
    expect(page).not_to have_content(others_private_page.title)
    expect(page).to have_content(public_page.title)
    Warden.test_reset!
  end

  scenario "sees upgrade link" do
    user = FactoryGirl.create(:user)

    login_as(user, :scope => :user)

    visit root_path

    expect(page).to have_content("Upgrade")

    Warden.test_reset!

  end
end
