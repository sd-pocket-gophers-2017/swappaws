class EventsController < ApplicationController

  def success
    @event = Event.find(params[:id])
    @sitter = User.find(@event.sitter_id)
    render 'success'
  end

  def index
    if params.has_key?(:event) && params[:event].has_key?(:start_date) # params are there
      start_date = DateTime.parse(event_params[:start_date])
      end_date = DateTime.parse(event_params[:end_date])

      @events = Event.where(start_date_time: start_date..end_date).near([current_user.latitude,current_user.longitude], event_params[:distance]).order(:start_date_time)
    else
      @events = Event.order(:start_date_time)
    end
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
    @user = current_user
    if @event.owner_id == nil
      @sitter = User.find_by(id: @event.sitter_id)
      @event.owner_id = current_user.id
      @user.tokens -= 1
      @sitter.tokens += 1
      @user.save
      @sitter.save
      @event.save
      redirect_to success_event_path
    else
      render 'show'
    end
  end

  private
    def event_params
      params.require(:event).permit(:sitter_id, :location, :start_date_time, :end_date_time, :owner_id, :distance, :start_date, :end_date)
    end

    # def event_search_params
    #   params.require(:event).require(:start_date, :end_date)
    # end
end
