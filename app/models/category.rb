class Category < ActiveRecord::Base

  def set_todo_titles
    @todos = []
    todos = Todo.where({"category_id" => self.id})
    todos.each do |t| 
      @todos <<  t.title
    end
  end

  def get_todo_titles
    self.set_todo_titles
    return @todos
  end

  def set_todos
    @todo_objects = Todo.where({"category_id" => self.id})
  end

  def get_todos
    self.set_todos
    return @todo_objects
  end

end