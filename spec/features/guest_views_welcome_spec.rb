require 'spec_helper'

include Warden::Test::Helpers
Warden.test_mode!

feature 'Guest views welcome page' do
  scenario 'public wikis are visible' do
    visit root_path

    expect(page).to have_content('guest account')
    expect(page).to have_content('Sign In')
    expect(page).to have_content('Sign Up')
    expect(page).to have_content('Lions')
    expect(page).to have_content('Tigers')
    expect(page).to have_content('Bears')

  end
end
