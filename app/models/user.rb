class User < ActiveRecord::Base

#See if there is a way to pass in the values that params gave us as arguments   here
  
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


  def self.set_login_errors(email_value, password_value)
    @errors = []
   
    @user = self.find_by_email(email_value)

    if @user == nil 
      @errors << "No user with that email address. Please enter a valid email address."
    end

    if email_value == ""
      @errors << "Please enter your email address."
    end
    
    if password_value == ""
      @errors << "Please enter your password."
    end

    if @user != nil
      if @user.password != password_value
      @errors << "Invalid password."
      end 
    end
  end


  def self.login_valid(email_value, password_value)
    self.set_login_errors(email_value, password_value) 
    if @errors == []
    return true
    else
    return false
    end 
  end


  def self.get_login_errors
    return @errors
  end

  def self.get_current_user
    return @user
  end



end