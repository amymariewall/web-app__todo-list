class Category < ActiveRecord::Base

  def set_todos
    @todos = []
    todos = Todo.where({"category_id" => self.id})
    todos.each do |t| 
      @todos <<  t.title
    end
  end

  def get_todos
    self.set_todos
    return @todos
  end

end