<% if @events_past_sittings.any? %>
  <h3><strong>My Past Sittings</strong></h3>
  <ul>
    <% @events_past_sittings.each do |event| %>
      <% owner = User.find(event.owner_id) %>
      <li>Owner: <%= owner.first_name %> <%= owner.last_name %></li>
      <li>Owner email: <%= owner.email %></li>
      <li><%= event.city %>, <%= event.state %></li>
      <li>Sitting from <%= date_time_helper(event.start_date_time) %> to <%= date_time_helper(event.end_date_time) %></li>
      <% unless Review.find_by(event: event, type_reviews: 'owner') %>
        <li> <%= link_to('Review', new_event_review_path(event)) %></li>
      <% end %>
    <% end %>
  </ul>
<% end %>
