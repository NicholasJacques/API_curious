class User < ActiveRecord::Base

  def self.from_omniauth(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      uid:         auth[:uid],
      provider:    auth[:provider],
      name:        auth[:info][:name],
      nickname:    auth[:info][:nickname],
      image_url:   auth[:info][:image],
      oauth_token: auth[:credentials][:token]
    }
    user.save
    user
  end
end
