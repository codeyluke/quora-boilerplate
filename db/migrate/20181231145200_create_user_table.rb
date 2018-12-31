require_relative "../../config/init.rb"

class CreateUserTable < ActiveRecord::Migration[5.2]
    def change
        create_table :users do |u|
            u.string :name
            u.string :email
            u.string :passwords
        end
    end
end