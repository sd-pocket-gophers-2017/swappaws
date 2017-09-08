class EventsController < ApplicationController

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
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(params[:id])
      redirect_to events_path
    else
      render 'edit'
    end
  end

  private
    def event_params
      params.require(:event).permit(:user_id, :location, :start_date_time, :end_date_time)
    end
end
