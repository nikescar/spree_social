class AddCaPathToAuthenticationMethods < ActiveRecord::Migration
  def change
    add_column  :spree_authentication_methods, :ca_path, :string
  end
end
