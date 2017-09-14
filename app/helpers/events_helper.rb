module EventsHelper

  def date_time_helper(date_time)
    "#{date_time.strftime('%A, %b %d, %Y')} at #{date_time.strftime('%I:%M %p')}"
  end

  def available?(event)
    event.owner == nil && event.pending && event.end_date_time > DateTime.now
  end

end
