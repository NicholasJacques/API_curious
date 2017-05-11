def stub_omniauth
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
    provider: "github",
    uid: "12345678",
    info: {
      image: "https://avatars3.githubusercontent.com/u/12345678?v=3",
      name: "Nicholas Jacques",
      nickname: "NicholasJacques",
      urls: {
        blog: "https://www.nicholasjacques.com/blog",
        GitHub: "https://github.com/NicholasJacques"
      },
    },
    credentials: {
      expires: false,
      token: "123456789abcdefghigjlm"
    }
  })
end
