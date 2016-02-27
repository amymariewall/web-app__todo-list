# This controller is for all the CRUD operations related to a Todo.

MyApp.get "/todo/add" do
  @current_user = User.get_current_user
  if @current_user != nil
  @users = User.all
  @categories = Category.all
  #add a thing that makes it "me" instead of the logged in users' name
  erb :"todos/add"
  else  
  redirect "/login"
  end
end

MyApp.post "/todo/create" do
    @current_user = User.find_by_id(session["user_id"]) 
    if @current_user != nil
      
    todo = Todo.new(title: params["title"], description: params["description"], created_by_user_id: session["user_id"], category_id: params["category_id"], completed: false)
    todo.save
   Assignment.create_assignments(params["users"], session["user_id"], todo.id)

    redirect "/todos/view"

    else
    redirect "/login"
    end  
end

MyApp.get "/todos/view" do
  @current_user = User.get_current_user
    if @current_user != nil 
      @uncompleted_todos = Todo.where({"completed" => false})
      @completed_todos = Todo.where({"completed" => true})
      erb :"todos/view_all"
    else
      params[:message] = "Must login to view to-do items."  
      redirect "/login" 
    end
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








