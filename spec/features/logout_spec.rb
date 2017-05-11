require 'rails_helper'

RSpec.feature 'user can logout' do
  let!(:user) { User.from_omniauth(stub_omniauth)}

  before :each do
    page.set_rack_session(user_id: user.id)
  end

  scenario 'as an authenticated user' do
    visit user_path(user.id)
    click_link 'Logout'

    expect(current_path).to eq(root_path)
    expect(page).to have_link('Login')
    expect(page).to_not have_link('Logout')
    expect(page).to_not have_content(user.name)
  end
end
