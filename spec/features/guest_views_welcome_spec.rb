require 'spec_helper'

include Warden::Test::Helpers

feature 'Guest views welcome page' do
  scenario 'public wikis are visible' do
    %w{Lions Tigers Bears}.each do |page|
      create(:page, title: page)
    end

    visit root_path

    expect(page).to have_content('guest account')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Lions')
    expect(page).to have_content('Tigers')
    expect(page).to have_content('Bears')

  end
end
