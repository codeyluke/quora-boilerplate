require_relative "../../config/init.rb"

class CreateVotesTable < ActiveRecord::Migration[5.2]
    def change
        create_table :votes do |v|
            v.integer :vote_count
            v.timestamps
            v.belongs_to :answer
            v.belongs_to :user
        end
    end
end