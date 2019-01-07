class Vote < ActiveRecord::Base
    belongs_to :user
    belongs_to :answer 
    validates :answer_id, uniqueness: {scope: :user, mesage: "ONLY 1 User allowed"}
end 
 
 