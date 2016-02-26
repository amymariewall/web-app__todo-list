# All controller actions related to categories

MyApp.get "/category/add" do
  @todos = Todo.all
  erb :"categories/add"  
end

MyApp.post "/category/create" do
  @category = Category.new(category_name: params["category_name"])
  binding.pry
  @category.save
  @todos = Todo.where({"id" => params["todos"]})
  @todos.update_all({"category_id" => @category.id})
  @categories = Category.all
  # Will ultimately want this to redirect to view ONE category page
  redirect "/categories/view"
end

MyApp.get "/categories/view" do 
  @categories = Category.all
  erb :"categories/view"
end

MyApp.get "/category/update/:id" do 
  @category = Category.find_by_id(params[:id])
  @todos = @category.get_todos
  erb :"categories/update"
end

MyApp.post "/category/process/update/:category_id" do
  Category.update(params[:category_id], category_name: params["category_name"] )
  todos = Todo.where("id" => params["todos"])
  todos.update_all(completed: true)
  redirect "/categories/view"
end
