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
  erb :"users/added"
end