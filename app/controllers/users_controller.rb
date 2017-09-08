class UsersController < ApplicationController

  def show
    if current_user
      current_user
    else
      redirect_to '/users/sign_in'
    end
  end

end
