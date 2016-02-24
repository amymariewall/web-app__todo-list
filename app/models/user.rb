class User < ActiveRecord::Base

#See if there is a way to pass in the values that params gave us as arguments here

def get_errors
  errors = []
  if self.name == ""
    errors << "Name cannot be blank"
  end
  if self.email == ""
    errors << "Email cannot be blank"
  elsif User.find_by_email(self.email) != nil
    errors << "Email is already in use by another account"
  elsif self.email.scan("@") == []
    errors << "You did not enter a valid email address"
  end
  if self.password == ""
    errors << "Password cannot be blank"
  end
  return errors
end

end