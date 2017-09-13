module UsersHelper
  
  def full_address(user)
    return "#{user.street_address} #{user.city}, #{user.state}"
  end

end
