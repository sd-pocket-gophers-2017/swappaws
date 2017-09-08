class EventsController < ApplicationController

  def new
    @event = Event.new
  end

# Only if logged in
  def create
    @event = Event.new(params[:event])
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
    # def event_params
    #   params.require(:event).permit(:start_date_time, :location)
    # end
end
