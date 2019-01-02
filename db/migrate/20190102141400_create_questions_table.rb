require_relative "../../config/init.rb"

class CreateQuestionsTable < ActiveRecord::Migration[5.2]
    def change
        create_table :questions do |q|
            q.string :question
            q.timestamps
            q.belongs_to :user
        end
    end
end