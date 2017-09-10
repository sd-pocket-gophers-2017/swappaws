module EventsHelper

  def date_time_helper(date_time)
    "#{date_time.strftime('%A, %b %d, %Y')} at #{date_time.strftime('%I:%M %p')}"
  end

  def available?(event)
    event.owner_id == nil
  end

end
