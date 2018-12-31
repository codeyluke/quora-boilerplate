require_relative "../../config/init.rb"

class AddColumnPassword < ActiveRecord::Migration[5.2]
    def change
        add_column :users, :password_digest, :string 
    end
end