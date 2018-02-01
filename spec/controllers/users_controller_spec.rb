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
      fill_in 'First Name', :with => 'Antonio'
      fill_in 'Last Name', :with => 'Margheriti'
      fill_in 'Tell us a bit about yourself', :with => "I'm an Italian filmmaker"
      fill_in 'Street address', :with => "518 Corner Place"
      fill_in 'City', :with => "El Cajon"
      fill_in 'State', :with => "California"
      fill_in 'Email', :with => "amargheriti@gmail.com"
      fill_in 'Password', :with => "password"
      fill_in 'Password confirmation', :with => "password"
      click_on 'Sign Up'
      expect(response).to have_http_status(:redirect)
    end
  end

end
