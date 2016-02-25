# This controller is for all the CRUD operations related to a Todo.

MyApp.get "/todo/add" do
  @current_user = User.find_by_id(session["user_id"])
  if @current_user != nil
  @users = User.all
  erb :"todos/add"
  else
    erb :"logins/must_login"
  end
end

MyApp.post "/todo/create" do
    @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      
    todo = Todo.new(title: params["title"], description: params["description"], user_id: params["user_id"], completed: false)
    todo.save
    #@message = "Successfully created #{todo.title} and assigned it to #{todo.user_name}!"
    redirect "/todos/view"

    else
    erb :"logins/must_login"
    end  
end

MyApp.get "/todos/view" do 
    @uncompleted_todos = Todo.where({"completed" => false})
    @completed_todos = Todo.where({"completed" => true})
    erb :"todos/view_all"
  end

MyApp.post "/todos/update" do
  todos = Todo.where("id" => params["todos"])
  todos.update_all(completed: true)
  @todos = Todo.get_titles(todos)
  #@message = "Great work completing: #{@todos}!"
  redirect "/todos/view"
end

MyApp.post "/todos/delete/:todo_id" do
  @todo = Todo.find_by_id(params["todo_id"])
  @message = "#{@todo.title} successfully deleted."
  @todo.delete
  redirect "/todos/view"

end








