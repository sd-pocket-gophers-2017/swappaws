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

<div class="row">
  <div class="col s12 m12 l12">
    <h2 class="flow-text">Here are all of our pets!</h2>
  </div>
  <br>
  <ul class="card">
    <div class="col s12 m9 l9 offset-l1">
      <% @pets.each do |pet| %>
        <div class="card striped">
          <div class="row">
            <div class="col s12 m4 l4">
              <li class="flow-text"><%= link_to("#{pet.name}", pet_path(pet)) %></li><%= image_tag pet.photo.url(:square) %>
            </div>
            <div class="col s12 m4 l4 offset-l1 ">
              <li>Age: <%= pet.age %></li>
              <li>Breed: <%= pet.breed %></li>
              <li>Size: <%= pet.size %></li>
              <li>Description: <%= pet.description %></li>
              <br>
            </div>
          </div>
        </div>
      <% end %>
    </div>
  </ul>
</div>
</div>
