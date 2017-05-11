require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates or updates itself from an oauth hash' do
    auth = {
      provider: 'github',
      uid: '12345678',
      info: {
        image: 'https://avatars3.githubusercontent.com/u/12345678?v=3',
        name: 'Nicholas Jacques',
        nickname: 'NicholasJacques',
        urls: {
          blog: 'https://www.nicholasjacques.com/blog',
          GitHub: 'https://github.com/NicholasJacques'
        },
      },
      credentials: {
        expires: false,
        token: '123456789abcdefghigjlm'
      }
    }

    User.from_omniauth(auth)
    new_user = User.first

    expect(new_user.uid).to eq('12345678')
    expect(new_user.provider).to eq('github')
    expect(new_user.name).to eq('Nicholas Jacques')
    expect(new_user.nickname).to eq('NicholasJacques')
    expect(new_user.image_url).to eq('https://avatars3.githubusercontent.com/u/12345678?v=3')
    expect(new_user.oauth_token).to eq('123456789abcdefghigjlm')
  end
end
