class CreateUser < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :name
      t.string :nickname
      t.string :image_url
      t.string :oauth_token

      t.timestamps null: :false
    end
  end
end
