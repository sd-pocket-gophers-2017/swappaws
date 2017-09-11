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
    p params[:tokens]
    if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'profile'
    end
  end

  # def purchase
  #   @user = current_user
  #   if @user
  #     # current_user.tokens.increment!(params[:tokens_to_purchase])
  #   else

  #   end
  # end
  def user_params
    params.require(:user).permit(:tokens)
  end

end
