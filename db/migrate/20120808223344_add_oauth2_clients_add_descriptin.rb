class AddOauth2ClientsAddDescriptin < ActiveRecord::Migration
  def change
  	add_column 'oauth2_clients', 'support_email', :string, limit:250, null: true
  	add_column 'oauth2_clients', 'contact_email', :string, limit:250, null: true
  	add_column 'oauth2_clients', 'app_description', :text, null: true
  end
end
