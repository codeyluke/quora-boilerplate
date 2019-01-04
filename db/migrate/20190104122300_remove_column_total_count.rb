class RemoveColumnTotalCount < ActiveRecord::Migration[5.2]
    def change
        remove_column :users, :total_counts ,:integer
    end
end