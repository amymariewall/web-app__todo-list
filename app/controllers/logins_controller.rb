# This controller is for all the CRUD operations related to a Login.

# Note that "logins" are not stored in the database. But there is still
# a reasonable way to think about a "login" as a resource which is created
# and deleted (i.e. 'logging out').
# 
# Reading and Updating a login, however, make a little less sense.

# MyApp.before do
#   @message = params[:message]
# end

MyApp.get "/login" do

  erb :"logins/new"
end

MyApp.post "/login/create" do
  if User.login_valid(params["email"], params["password"]) == false
    @errors = User.get_login_errors
    binding.pry
  erb :"logins/new"

  else 
    @user = User.get_current_user
    session["user_id"] = @user.id
    redirect "/"
  end
end

MyApp.get "/logout" do
  session["user_id"] = nil
  erb :"logins/logout_successful"
end