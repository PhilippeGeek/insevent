class EventsController < ApplicationController
  def index
    @events = Event.published
    respond_to do |format|
      format.html { render }
      format.json { render json: @events }
    end
  end

  def show
    @event = Event.published.find params[:id].to_i
    respond_to do |format|
      format.html { render }
      format.json { render json: @event }
    end
  end

  def new
    @event = Event.new
    respond_to do |format|
      format.html { render }
    end
  end

  def create
    @event = Event.new event_params
    success = @event.save
    respond_to do |format|
      format.html do
        if success
          redirect_to @event
        else
          render :new
        end
      end
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :time, :location, :email, :website, tags_ids: [])
  end
end
