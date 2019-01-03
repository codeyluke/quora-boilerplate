require_relative "../../config/init.rb"

class CreateAnswerTable < ActiveRecord::Migration[5.2]
    def change
        create_table :answers do |a|
            a.string :answer
            a.timestamps
            a.belongs_to :question
            a.belongs_to :user
        end
    end
end