class Assignment < ActiveRecord::Base
    
    def self.create_assignment(user_ids)
      user_ids.each do |u|
        assignment = Assignment.new(assigned_to_user_id: u, assigned_by_user_id: session["user_id"], todo_id: todo.id)
        assignment.save
        end
    end

end