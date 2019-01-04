require_relative "../../config/init.rb"

class AddingTotalVotesUser < ActiveRecord::Migration[5.2]
    def change
        add_column :users, :total_counts, :integer
    end
end