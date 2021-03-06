require_relative "./_configure"

DB.define_table("users")
DB.define_column("users", "name", "string")
DB.define_column("users", "email", "string")
DB.define_column("users", "password", "string")

DB.define_table("todos")
DB.define_column("todos", "title", "string")
DB.define_column("todos", "description", "text")
DB.define_column("todos", "completed", "boolean")
DB.define_column("todos", "created_by_user_id", "integer")
DB.define_column("todos", "category_id", "integer")

# Figure out the best way to implement a validation where the assigned by #user_id must belong to a user who has task assignment permissions

DB.define_table("assignments")
DB.define_column("assignments", "todo_id", "integer")
DB.define_column("assignments", "assigned_by_user_id", "integer")
DB.define_column("assignments", "assigned_to_user_id", "integer")

DB.define_table("categories")
DB.define_column("categories", "category_name", "string")