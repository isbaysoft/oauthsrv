class CreateOauth2Clients < ActiveRecord::Migration
  def change
  	add_column 'oauth2_clients', 'user_id', :integer, null: false
  end
end
