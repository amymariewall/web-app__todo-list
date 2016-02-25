class Todo < ActiveRecord::Base

  def user_name
    x = User.find_by_id(self.user_id)
    y = x.name
    return y
  end

end