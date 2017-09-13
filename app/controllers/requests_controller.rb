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
      redirect_to profile_path
    else
      flash.now[:error] = @request.errors.full_message.join('<br/>')
      render 'new'
    end
  end

  def request_confirmation
    @request = Request.find(params[:id])
    @event = Event.find(params[:event_id ])
    @owner = User.find(@request.owner_id)
    @events_as_owner = Event.where(owner: @owner)
    @events_as_sitter = Event.where(sitter: @owner)
    render 'confirmation'
  end

  def show
    @request = Request.find(params[:id])
  end

  def confirmed_confirmation
    @request = Request.find(params[:id])
    @event = @request.event
    @owner = User.find(@request.owner_id)
    @sitter = @event.sitter
    if @request.update(request_params)
      @event.pending = false
      @event.owner_id = @request.owner_id
      @event.save
      @owner.tokens -= 1
      @sitter.tokens += 1
      @owner.save
      @sitter.save
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
