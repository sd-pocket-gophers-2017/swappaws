module UsersHelper
  
  def token_decrement
    events = Event.where(owner_id: current_user.id)
    events.count
  end

end
