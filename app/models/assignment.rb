class Assignment < ActiveRecord::Base
    
    def self.create_assignments(user_ids, creator, todo_id)
      user_ids.each do |u|
        assignment = Assignment.new(assigned_to_user_id: u, assigned_by_user_id: creator, todo_id: todo_id)
        assignment.save
        end
    end

end