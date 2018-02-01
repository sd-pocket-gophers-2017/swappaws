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

end
