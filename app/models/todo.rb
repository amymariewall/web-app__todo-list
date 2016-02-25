class Todo < ActiveRecord::Base

  def user_name
    x = User.find_by_id(self.user_id)
    y = x.name
    return y
  end

  def self.get_titles(active_record_collection_of_todos)
    todos = ""
    active_record_collection_of_todos.each do |t| 
      todos << "#{t.title} "
    end
    return todos
  end

end