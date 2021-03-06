# This controller is for all the CRUD operations related to a User.

MyApp.get "/" do
  erb :"welcome"
end

MyApp.get "/user/add" do
  erb :"users/add"
end

MyApp.post "/user/create" do
  @user = User.new(name: params["name"], email: params["email"], password: params["password"])

  if @user.is_valid == true
    @user.save
    redirect "/users/view"

  else
    @errors = @user.get_errors   
    erb :"users/add"
  end
end

MyApp.get "/users/view" do
  @users = User.all
  erb :"users/view_all"
end


MyApp.get "/user/view/:id" do
  @user = User.find_by_id(params[:id])
  @assignments = Assignment.where({"assigned_to_user_id" => params[:id]})
  todo_ids = Assignment.get_todos(@assignments)
  @completed_todos = Todo.where({"id" => todo_ids}).where({"completed" => true})
  @uncompleted_todos = Todo.where({"id" => todo_ids}).where({"completed" => false})
  binding.pry
  erb :"users/view"
end

MyApp.get "/user/update/:id" do
  @user = User.find_by_id(params[:id])
  erb :"users/update"
end

MyApp.post "/user/update/:id" do
  @user = User.find_by_id(params[:id])
  @user.assign_attributes(name: params["name"], email: params["email"], password: params["password"])
  if @user.is_valid == true
    @user.save
    #@message = "#{@user.name} updated."
    
    redirect "/user/view/#{@user.id}"
  
  else
    @invalid_user = User.find_by_id(params[:id])
    @invalid_user.assign_attributes(name: params["name"], email: params["email"], password: params["password"])
    @errors = @invalid_user.get_errors
    @user = User.find_by_id(params[:id])
    @user.assign_attributes(name: @user.name, email: @user.email, password: @user.password)   
    erb :"users/update"
  end
end

MyApp.post "/user/delete/:id" do
  @user = User.find_by_id(params[:id])
  @message = "#{@user.name} deleted."
  @user.delete
  redirect "/users/view" 
end





