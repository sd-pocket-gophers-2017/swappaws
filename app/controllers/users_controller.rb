class UsersController < ApplicationController

  def show
    @events = Event.all
    if current_user
      current_user
    else
      redirect_to '/users/sign_in'
    end
  end

  def purchase
    @user = current_user
  end

  def update_tokens
    @user = current_user
    if @user
      @user.tokens += user_params[:tokens].to_i
      @user.save
      redirect_to @user
    else
      render 'profile'
    end
  end

  def user_params
    params.require(:user).permit(:tokens)
  end

end
