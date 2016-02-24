class User < ActiveRecord::Base

#See if there is a way to pass in the values that params gave us as arguments here

  def set_errors
    errors = []
    if self.name == ""
      errors << "Name cannot be blank"
    end
    if self.email == ""
      errors << "Email cannot be blank"
    end


    # else 
    #   User.where.not({"id" => self.id}).find_by_email(self.email) != nil
    #   errors << "Email is already in use by another account"
    if self.email.scan("@") == []
      errors << "You did not enter a valid email address"
    end
    
    if self.password == ""
      errors << "Password cannot be blank"
    end
    
    return errors
  end

  def get_errors
    errors = self.set_errors
    return errors
  end

  def is_valid
    if self.get_errors == []
    return true
    else
    return false
    end 
  end  

end