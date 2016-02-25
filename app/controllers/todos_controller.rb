# This controller is for all the CRUD operations related to a Todo.

MyApp.get "/todo/add" do
  @users = User.all
  erb :"todos/add"
end

MyApp.post "/todo/create" do
  @curent_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      binding.pry
  todo = Todo.new(title: params["title"], description: params["description"], user_id: params["user_id"], completed: false)
  todo.save
  @message = "Successfully created #{todo.title} and assigned it to #{todo.user_name}!"
  erb :"todos/added"

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
  @message = "Great work completing: #{@todos}!"
  erb :"todos/added"
end
