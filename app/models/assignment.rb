class Assignment < ActiveRecord::Base
    
    def self.create_assignments(user_ids, creator, todo_id)
      user_ids.each do |u|
        assignment = Assignment.new(assigned_to_user_id: u, assigned_by_user_id: creator, todo_id: todo_id)
        assignment.save
        end
    end

    def self.set_todos(assignments)
      @todo_ids = []
      assignments.each do |a|
        @todo_ids << a.todo_id
      end
    end

    def self.get_todos(assignments)
      self.set_todos(assignments)
      return @todo_ids
    end 
end