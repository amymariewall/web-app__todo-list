# This controller is for all the CRUD operations related to a User.

MyApp.get "/" do
  erb :"users/add"
end

MyApp.get "/user/add" do
  erb :"users/add"
end

MyApp.post "/user/create" do
  @user = User.new(name: params["name"], email: params["email"], password: params["password"])
  @user.save
  @message = "#{@user.name} successfully created!"
  erb :"users/added"
end

MyApp.get "/users/view" do
  @users = User.all
  erb :"users/view_all"
end


MyApp.get "/user/view/:id" do
  @user = User.find_by_id(params[:id])
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
    @message = "#{@user.name} updated."
    
    erb :"users/added"
  
  else
    @invalid_user = User.find_by_id(params[:id])
    @invalid_user.assign_attributes(name: params["name"], email: params["email"], password: params["password"])
    @errors = @invalid_user.get_errors
    binding.pry
    @user = User.find_by_id(params[:id])
    @user.assign_attributes(name: @user.name, email: @user.email, password: @user.password)   
    erb :"users/update"
  end
end




