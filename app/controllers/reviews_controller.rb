class ReviewsController < ApplicationController

  def new
    @event = Event.find(params[:event_id])
    @review = Review.new
  end

  def index
    @event = Event.find(params[:event_id])
    @reviews = Review.order(:created_at)
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @event = Event.find(params[:event_id])
    @review = Review.new(review_params)
    @review.event = @event
    if @review.save && @event.sitter == current_user
        Review.update(type_reviews:'owner')
        redirect_to event_reviews_path(@event)
    elsif  @review.save && @event.owner == current_user
        Review.update(type_reviews:'sitter')
        redirect_to event_reviews_path(@event)
    else
      render 'new'
    end
  end

  private
    def review_params
      params.require(:review).permit(:body)
    end
  end
