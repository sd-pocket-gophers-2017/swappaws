require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #profile" do
    it "returns http redirect as it routes through #users_show route" do
      get :show
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET /" do 
    it "welcomes page visitor, user or non user" do 
      visit '/'
      expect(page).to have_content('Kennels and boarding can be ruff.')
    end
  end

  describe "User creation" do 
    it "allows for straightforward, successful creation of user accounts", :js => true do 
      visit new_user_registration_path
      fill_in 'user[first_name]', :with => 'Antonio'
      fill_in 'user_last_name', :with => 'Margheriti'
      fill_in 'user[bio]', :with => "I'm an Italian filmmaker"
      fill_in 'user_street_address', :with => "518 Corner Place"
      fill_in 'user_city', :with => "El Cajon"
      fill_in 'user_state', :with => "California"
      fill_in 'user_email', :with => "amargheriti@gmail.com"
      fill_in 'user_password', :with => "password"
      fill_in 'user_password_confirmation', :with => "password"
      click_on 'Sign Up'
      expect(response).to have_http_status(:success)
    end
  end

end
