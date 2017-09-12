class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    @event = Event.find(params[:id])
    @request = Request.new(request_params)
    @request.event = @event
    @request.owner = current_user
    if @request.save
      flash[:notice] = "Successfully created request"
      redirect_to @request
    else
      flash.now[:error] = @request.errors.full_message.join('<br/>')
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def index
  end

  def delete
  end
  private
    def request_params
      params.require(:request).permit(:note)
    end
end
