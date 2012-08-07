class UsersAddLastName < ActiveRecord::Migration
  def up
  	add_column 'users', 'last_name', :string, nil: true, limit: 50
  	add_column 'users', 'first_name', :string, nil: true, limit: 50
  	add_column 'users', 'alternate_name', :string, nil: true, limit: 50
  end

  def down
  	remove_columns 'users', 'last_name', 'first_name', 'alternate_name'
  end
end
