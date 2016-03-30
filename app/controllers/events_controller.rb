class EventsController < ApplicationController
  def index
    @events = Event.published
  end

  def show
    @event = Event.find params[:id].to_i
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :time, :location, :email, :website, tags_ids: [])
  end
end
