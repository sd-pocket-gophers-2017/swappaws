class RequestsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @request = Request.new
  end

  def create
    @event = Event.find(params[:event_id])
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

  def request_confirmation
    @request = Request.find(params[:id])
    @event = Event.find(params[:event_id ])
    render 'confirmation'
  end

  def show
    @request = Request.find(params[:id])
  end

  def confirmed_confirmation
    @request = Request.find(params[:id])
    @event = @request.event
    if @request.update(request_params)
      @event.pending = false
      @event.save
      redirect_to profile_path
    else
      render 'confirmation'
    end
  end

  def denied_confirmation
    @request = Request.find(params[:id])
    if @request.update(request_params)
      redirect_to profile_path
    else
      render 'confirmation'
    end
  end


  def edit
  end

  def index
  end

  def delete
  end
  private
  def request_params
    params.require(:request).permit(:note, :approved)
  end
end
