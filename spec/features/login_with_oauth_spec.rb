require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using github oauth' do
    stub_omniauth

    visit root_path
    expect(page).to have_link('Login')

    click_link 'Login'
    expect(current_path).to eq(user_path(User.first.id))
    expect(page).to have_content('NicholasJacques')
    expect(page).to have_link('Logout')
    expect(page).to_not have_link('Login')
  end
end
