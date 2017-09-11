class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def index
    @event = Event.find(:event_id)
    @review = Review.order(:created_at)
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @event = Event.find(:event_id)
    @review = Review.new(review_params)
    if @review.save
      redirect_to events_path(@review)
    else
      render 'new'
    end
  end

  private
    def review_params
      params.require(:event).permit(:sitter_id, :location, :start_date_time, :end_date_time, :owner_id)
    end
  end
