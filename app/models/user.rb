class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

class AddGoogleTokensToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :google_token, :string
    add_column :users, :google_refresh_token, :string
    add_column :users, :google_token_expires_at, :datetime
  end
end

class User < ApplicationRecord
  # Method to check if the token is expired
  def google_token_expired?
    google_token_expires_at && Time.now > google_token_expires_at
  end

  # Method to refresh the token if expired (uses refresh_token)
  def refresh_google_token!
    return unless google_refresh_token

    response = RestClient.post('https://oauth2.googleapis.com/token', {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      refresh_token: google_refresh_token,
      grant_type: 'refresh_token'
    })

    data = JSON.parse(response.body)

    self.update(
      google_token: data['access_token'],
      google_token_expires_at: Time.now + data['expires_in'].seconds
    )
  end
end


