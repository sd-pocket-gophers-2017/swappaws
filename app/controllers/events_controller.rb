class EventsController < ApplicationController

  def success
    render 'success'
  end

  def index
    #Didn't know you could do Event.order without calling all, cool!
    @events = Event.order(:start_date_time)
  end

  def new
    @event = Event.new
  end

# Only if logged in
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to events_path(@event)
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
    @sitter = User.find_by(id: @event.sitter_id)
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  def book
    @event = Event.find(params[:id])
    if @event.owner_id == nil
      @event.owner_id = current_user.id
      @event.save
      redirect_to success_path
    else
      render 'show'
    end
  end

  private
    def event_params
      params.require(:event).permit(:sitter_id, :location, :start_date_time, :end_date_time, :owner_id)
    end
end
