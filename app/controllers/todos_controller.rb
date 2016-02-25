# This controller is for all the CRUD operations related to a Todo.

MyApp.get "/todo/add" do
  @users = User.all
  erb :"todos/add"
end

MyApp.post "/todo/create" do
  todo = Todo.new(title: params["title"], description: params["description"], user_id: params["user_id"], completed: false)
  todo.save
  @message = "Successfully created #{todo.title} and assigned it to #{todo.user_name}!"
  binding.pry
  erb :"todos/added"  
end

MyApp.get "/todos/view" do 
    @todos = Todo.all
    erb :"todos/view_all"
  end
