require 'spec_helper'


feature 'Guest views welcome page' do
  scenario 'public wikis are visible' do
    %w{Lions Tigers Bears}.each do |page|
      create(:page, title: page)
    end

    visit root_path

    expect(page).to have_content('Guest Account')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Lions')
    expect(page).to have_content('Tigers')
    expect(page).to have_content('Bears')
  end

  feature 'Guest doesn see private wikis' do
    scenario 'public wikis are visible' do
      %w{Lions Tigers Bears}.each do |page|
        create(:page, title: page)
      end

      %w{LaserSharks PolarWeasels}.each do |private_pages|
        create(:page, title: private_pages, private: true)
      end

      visit root_path

      expect(page).to have_content('Guest Account')
      expect(page).to have_content('Sign In')
      expect(page).to have_content('Sign Up')
      expect(page).to have_content('Lions')
      expect(page).to have_content('Tigers')
      expect(page).to have_content('Bears')

      expect(page).not_to have_content('LaserSharks')
      expect(page).not_to have_content('PolarWeasels')
    end
  end

  scenario "does not see Upgrade link on welcome" do
    visit root_path

    expect(page).not_to have_content('Upgrade')
  end

  scenario "does not see Upgrade link on welcome" do
    3.times do
      create(:page)
    end
    public_page = Page.public.first
    visit page_path(public_page)

    expect(page).not_to have_content('Upgrade')
  end
end
