require 'rails_helper'

RSpec.feature "user logs in" do
  scenario "using github oauth" do
    stub_omniauth

    visit root_path
    expect(page).to have_link("Sign in with Github")

    click_link "Sign in with Github"
    expect(current_path).to eq(user_path(User.first.id))
    expect(page).to have_content("Nicholas Jacques")
    expect(page).to have_link("Logout")
    expect(page).to_not have_link("Sign in with Github")
  end
end
