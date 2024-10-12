class AddGoogleAuthFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string unless column_exists?(:users, :name)
    add_column :users, :google_token, :string unless column_exists?(:users, :google_token)
    add_column :users, :google_refresh_token, :string unless column_exists?(:users, :google_refresh_token)
  end
end
