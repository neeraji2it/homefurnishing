class AddProviderUidTokenToUser < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :oauth_token, :string
    add_column :users, :secret, :string
    add_column :users, :details, :text
  end
end
