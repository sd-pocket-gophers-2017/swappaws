class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @events_as_owner = Event.where(owner: current_user)
    @events_as_sitter = Event.where(sitter: current_user)
    @events = @events_as_owner + @events_as_sitter
    @events_past_sitters = Event.closed.order(:start_date_time).where(owner: current_user)
    @events_past_sittings = Event.closed.order(:start_date_time).where(sitter: current_user)
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

  private
  def user_params
    params.require(:user).permit(:tokens)
  end

end
